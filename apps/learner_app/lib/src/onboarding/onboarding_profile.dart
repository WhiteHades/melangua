class OnboardingProfile {
  const OnboardingProfile({
    required this.displayName,
    required this.languageCode,
    required this.level,
    required this.weeklyGoalMinutes,
  });

  final String displayName;
  final String languageCode;
  final String level;
  final int weeklyGoalMinutes;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'languageCode': languageCode,
      'level': level,
      'weeklyGoalMinutes': weeklyGoalMinutes,
    };
  }

  static OnboardingProfile fromMap(Map<String, dynamic> map) {
    return OnboardingProfile(
      displayName: map['displayName'] as String? ?? '',
      languageCode: map['languageCode'] as String? ?? 'de',
      level: map['level'] as String? ?? 'a1',
      weeklyGoalMinutes: map['weeklyGoalMinutes'] as int? ?? 60,
    );
  }
}
