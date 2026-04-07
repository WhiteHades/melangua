import 'dart:convert';

import '../state/settings_state.dart';
import 'onboarding_profile.dart';
import 'sync_queue.dart';

class OnboardingRepository {
  OnboardingRepository({
    required SettingsValueStore store,
    required SyncQueueRepository syncQueue,
  })  : _store = store,
        _syncQueue = syncQueue;

  static const String _profileKey = 'melingo_onboarding_profile_v1';

  final SettingsValueStore _store;
  final SyncQueueRepository _syncQueue;

  Future<OnboardingProfile?> readProfile() async {
    final String? raw = await _store.readString(_profileKey);
    if (raw == null || raw.isEmpty) {
      return null;
    }

    final Map<String, dynamic> map = jsonDecode(raw) as Map<String, dynamic>;
    return OnboardingProfile.fromMap(map);
  }

  Future<void> saveProfileLocalFirst(OnboardingProfile profile) async {
    await _store.writeString(_profileKey, jsonEncode(profile.toMap()));
    await _syncQueue.enqueue(
      SyncQueueItem(
        type: 'onboarding_profile_upsert',
        payload: profile.toMap(),
        createdAtIso: DateTime.now().toUtc().toIso8601String(),
      ),
    );
  }
}
