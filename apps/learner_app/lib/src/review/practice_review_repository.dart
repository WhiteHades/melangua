import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/settings_state.dart';

class PracticeReviewTurn {
  const PracticeReviewTurn({
    required this.turnId,
    required this.occurredAtIso,
    required this.transcript,
    required this.correctedText,
    required this.explanation,
    required this.nextPrompt,
    required this.assistantResponseText,
    required this.mistakeTags,
  });

  final String turnId;
  final String occurredAtIso;
  final String transcript;
  final String correctedText;
  final String explanation;
  final String nextPrompt;
  final String assistantResponseText;
  final List<String> mistakeTags;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'turnId': turnId,
      'occurredAtIso': occurredAtIso,
      'transcript': transcript,
      'correctedText': correctedText,
      'explanation': explanation,
      'nextPrompt': nextPrompt,
      'assistantResponseText': assistantResponseText,
      'mistakeTags': mistakeTags,
    };
  }

  static PracticeReviewTurn fromMap(Map<String, dynamic> map) {
    return PracticeReviewTurn(
      turnId: map['turnId'] as String,
      occurredAtIso: map['occurredAtIso'] as String,
      transcript: map['transcript'] as String,
      correctedText: map['correctedText'] as String,
      explanation: map['explanation'] as String,
      nextPrompt: map['nextPrompt'] as String,
      assistantResponseText: map['assistantResponseText'] as String,
      mistakeTags: (map['mistakeTags'] as List<dynamic>)
          .whereType<String>()
          .toList(growable: false),
    );
  }
}

class PracticeReviewRepository {
  PracticeReviewRepository({
    required SettingsValueStore store,
    required SecretMaterialStore secretMaterialStore,
  }) : _store = EncryptedSettingsValueStore(
          inner: store,
          secretMaterialStore: secretMaterialStore,
        );

  static const String _reviewKey = 'melangua_review_turns_v1';

  final SettingsValueStore _store;

  Future<List<PracticeReviewTurn>> readAll() async {
    final String? raw = await _store.readString(_reviewKey);
    if (raw == null || raw.isEmpty) {
      return const <PracticeReviewTurn>[];
    }

    final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
    final List<PracticeReviewTurn> turns = decoded
        .map((dynamic row) =>
            PracticeReviewTurn.fromMap(row as Map<String, dynamic>))
        .toList(growable: false);
    turns.sort((a, b) => a.occurredAtIso.compareTo(b.occurredAtIso));
    return turns;
  }

  Future<void> append(PracticeReviewTurn turn) async {
    final List<PracticeReviewTurn> existing = await readAll();
    final List<PracticeReviewTurn> next = <PracticeReviewTurn>[
      ...existing,
      turn
    ];
    await _store.writeString(
      _reviewKey,
      jsonEncode(next.map((e) => e.toMap()).toList(growable: false)),
    );
  }
}

final Provider<PracticeReviewRepository> practiceReviewRepositoryProvider =
    Provider<PracticeReviewRepository>((Ref ref) {
  final SettingsValueStore store = ref.watch(settingsStoreProvider);
  final SecretMaterialStore secretMaterialStore =
      ref.watch(secretMaterialStoreProvider);
  return PracticeReviewRepository(
    store: store,
    secretMaterialStore: secretMaterialStore,
  );
});
