import 'helpers.dart';

enum Gender { male, female }

enum Goal { lose, maintain, gain }

const goalLabels = {
  Goal.lose: 'Giảm cân',
  Goal.maintain: 'Giữ cân',
  Goal.gain: 'Tăng cân',
};

class UserProfile {
  final String name;
  final int age;
  final Gender gender;
  final double heightCm;
  final double weightKg;
  final int activityLevel; // 0..4
  final Goal goal;
  final List<String> conditions;
  final List<String> allergies;
  final bool vegetarian;
  final String region;
  final int calorieAdjust; // điều chỉnh kcal do "thích nghi tuần sau"

  const UserProfile({
    required this.name,
    required this.age,
    required this.gender,
    required this.heightCm,
    required this.weightKg,
    this.activityLevel = 1,
    this.goal = Goal.maintain,
    this.conditions = const [],
    this.allergies = const [],
    this.vegetarian = false,
    this.region = 'bac',
    this.calorieAdjust = 0,
  });

  UserProfile copyWith({
    String? name,
    int? age,
    Gender? gender,
    double? heightCm,
    double? weightKg,
    int? activityLevel,
    Goal? goal,
    List<String>? conditions,
    List<String>? allergies,
    bool? vegetarian,
    String? region,
    int? calorieAdjust,
  }) {
    return UserProfile(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      activityLevel: activityLevel ?? this.activityLevel,
      goal: goal ?? this.goal,
      conditions: conditions ?? this.conditions,
      allergies: allergies ?? this.allergies,
      vegetarian: vegetarian ?? this.vegetarian,
      region: region ?? this.region,
      calorieAdjust: calorieAdjust ?? this.calorieAdjust,
    );
  }

  Map<String, Object?> toMap() => {
    'id': 1,
    'name': name,
    'age': age,
    'gender': gender.index,
    'heightCm': heightCm,
    'weightKg': weightKg,
    'activityLevel': activityLevel,
    'goal': goal.index,
    'conditions': conditions.join(','),
    'allergies': allergies.join(','),
    'vegetarian': vegetarian ? 1 : 0,
    'region': region,
    'calorieAdjust': calorieAdjust,
  };

  factory UserProfile.fromMap(Map<String, Object?> m) => UserProfile(
    name: m['name'] as String,
    age: m['age'] as int,
    gender: Gender.values[m['gender'] as int],
    heightCm: (m['heightCm'] as num).toDouble(),
    weightKg: (m['weightKg'] as num).toDouble(),
    activityLevel: m['activityLevel'] as int,
    goal: Goal.values[m['goal'] as int],
    conditions: splitCsv(m['conditions']),
    allergies: splitCsv(m['allergies']),
    vegetarian: (m['vegetarian'] as int) == 1,
    region: m['region'] as String,
    calorieAdjust: m['calorieAdjust'] as int,
  );
}
