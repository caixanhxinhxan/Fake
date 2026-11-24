/// Một món trong thực đơn: ngày + bữa (sang/trua/toi/phu) + món + khẩu phần.
class PlanItem {
  final String id;
  final String date; // yyyy-MM-dd
  final String mealType;
  final String foodId;
  final double servings;
  final bool isDone;

  const PlanItem({
    required this.id,
    required this.date,
    required this.mealType,
    required this.foodId,
    this.servings = 1,
    this.isDone = false,
  });

  PlanItem copyWith({String? foodId, double? servings, bool? isDone}) =>
      PlanItem(
        id: id,
        date: date,
        mealType: mealType,
        foodId: foodId ?? this.foodId,
        servings: servings ?? this.servings,
        isDone: isDone ?? this.isDone,
      );

  Map<String, Object?> toMap() => {
    'id': id,
    'date': date,
    'mealType': mealType,
    'foodId': foodId,
    'servings': servings,
    'isDone': isDone ? 1 : 0,
  };

  factory PlanItem.fromMap(Map<String, Object?> m) => PlanItem(
    id: m['id'] as String,
    date: m['date'] as String,
    mealType: m['mealType'] as String,
    foodId: m['foodId'] as String,
    servings: (m['servings'] as num).toDouble(),
    isDone: (m['isDone'] as int) == 1,
  );
}
