import './helpers.dart';

/// Một món đã ăn. Các giá trị dinh dưỡng là TỔNG (đã nhân khẩu phần).
class DiaryEntry {
  final String id;
  final String date; // yyyy-MM-dd
  final String mealType; // sang | trua | toi | phu
  final String name;
  final String? foodId;
  final double servings;
  final double calories, protein, fat, carbs, fiber;
  final List<String> tags;
  final bool isUnplanned; // món phát sinh ngoài kế hoạch
  final String note;

  const DiaryEntry({
    required this.id,
    required this.date,
    required this.mealType,
    required this.name,
    this.foodId,
    this.servings = 1,
    required this.calories,
    this.protein = 0,
    this.fat = 0,
    this.carbs = 0,
    this.fiber = 0,
    this.tags = const [],
    this.isUnplanned = false,
    this.note = '',
  });

  bool get isJunk =>
      tags.contains('fast_food') ||
      tags.contains('high_sugar') ||
      tags.contains('fried');

  Map<String, Object?> toMap() => {
    'id': id,
    'date': date,
    'mealType': mealType,
    'name': name,
    'foodId': foodId,
    'servings': servings,
    'calories': calories,
    'protein': protein,
    'fat': fat,
    'carbs': carbs,
    'fiber': fiber,
    'tags': tags.join(','),
    'isUnplanned': isUnplanned ? 1 : 0,
    'note': note,
  };

  factory DiaryEntry.fromMap(Map<String, Object?> m) => DiaryEntry(
    id: m['id'] as String,
    date: m['date'] as String,
    mealType: m['mealType'] as String,
    name: m['name'] as String,
    foodId: m['foodId'] as String?,
    servings: (m['servings'] as num).toDouble(),
    calories: (m['calories'] as num).toDouble(),
    protein: (m['protein'] as num).toDouble(),
    fat: (m['fat'] as num).toDouble(),
    carbs: (m['carbs'] as num).toDouble(),
    fiber: (m['fiber'] as num).toDouble(),
    tags: splitCsv(m['tags']),
    isUnplanned: (m['isUnplanned'] as int) == 1,
    note: (m['note'] as String?) ?? '',
  );
}

class Totals {
  final double kcal, protein, fat, carbs, fiber;
  const Totals(this.kcal, this.protein, this.fat, this.carbs, this.fiber);

  factory Totals.of(Iterable<DiaryEntry> es) {
    double k = 0, p = 0, f = 0, c = 0, fi = 0;
    for (final e in es) {
      k += e.calories;
      p += e.protein;
      f += e.fat;
      c += e.carbs;
      fi += e.fiber;
    }
    return Totals(k, p, f, c, fi);
  }
}
