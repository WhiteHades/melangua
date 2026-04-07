abstract class AiBridgePlatform {
  Future<void> initialize();
  Future<String> runAsr({required List<int> pcm16leBytes});
  Future<String> runTutor({required String transcript});
  Future<List<int>> runTts({required String responseText});
}

class UnimplementedAiBridgePlatform implements AiBridgePlatform {
  @override
  Future<void> initialize() async {}

  @override
  Future<String> runAsr({required List<int> pcm16leBytes}) async {
    if (pcm16leBytes.isEmpty) {
      return '';
    }
    return 'simulated transcript';
  }

  @override
  Future<String> runTutor({required String transcript}) async {
    return 'tutor_not_configured';
  }

  @override
  Future<List<int>> runTts({required String responseText}) async {
    return <int>[];
  }
}
