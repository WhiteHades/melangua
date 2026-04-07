import 'package:cryptography/cryptography.dart';

class ModelIntegrity {
  const ModelIntegrity._();

  static Future<String> sha256Hex(List<int> bytes) async {
    final Hash hash = await Sha256().hash(bytes);
    final StringBuffer buffer = StringBuffer();
    for (final int value in hash.bytes) {
      buffer.write(value.toRadixString(16).padLeft(2, '0'));
    }
    return buffer.toString();
  }
}
