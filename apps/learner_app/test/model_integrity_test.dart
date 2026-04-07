import 'package:flutter_test/flutter_test.dart';
import 'package:learner_app/src/model_manager/model_integrity.dart';

void main() {
  test('sha256Hex hashes deterministic model bytes', () async {
    final List<int> bytes = 'melingo-lite-model-v1'.codeUnits;

    final String hash = await ModelIntegrity.sha256Hex(bytes);

    expect(
      hash,
      '9e3fdf35883bcc2410a05188960b71240696d9c5424cdd79f93d904d8aec3272',
    );
  });
}
