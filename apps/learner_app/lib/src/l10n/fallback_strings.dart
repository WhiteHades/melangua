import 'package:flutter/widgets.dart';

class FallbackStrings {
  const FallbackStrings._();

  static String appName(BuildContext context) => 'Melingo';
  static String settingsTitle(BuildContext context) => 'Settings';
  static String diagnosticsOptIn(BuildContext context) => 'Diagnostics opt-in';
  static String storeRawAudio(BuildContext context) => 'Store raw audio locally';
  static String encryptionStatus(BuildContext context) => 'Encryption status';
  static String encryptionEnabled(BuildContext context) =>
      'enabled for sensitive settings';
  static String encryptionDisabled(BuildContext context) => 'disabled';
}
