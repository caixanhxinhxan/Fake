import './helpers.dart';

/// mealType: 'sang' | 'chinh' (dùng cho trưa/tối) | 'phu'
class Food {
  final String id;
  final String name;
  final String emoji;
  final String mealType;
  final double calories, protein, fat, carbs, fiber;
  final List<String> tags;
  final String region; // bac | trung | nam | all
  final String ingredients; // mỗi dòng một nguyên liệu
  final String steps; // mỗi dòng một bước
  final bool isFavorite;
  final bool isCustom;

  const Food({
    required this.id,
    required this.name,
    this.emoji = '🍽️',
    required this.mealType,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
    this.fiber = 0,
    this.tags = const [],
    this.region = 'all',
    this.ingredients = '',
    this.steps = '',
    this.isFavorite = false,
    this.isCustom = false,
  });

  bool hasTag(String t) => tags.contains(t);

  Food copyWith({bool? isFavorite}) => Food(
    id: id,
    name: name,
    emoji: emoji,
    mealType: mealType,
    calories: calories,
    protein: protein,
    fat: fat,
    carbs: carbs,
    fiber: fiber,
    tags: tags,
    region: region,
    ingredients: ingredients,
    steps: steps,
    isFavorite: isFavorite ?? this.isFavorite,
    isCustom: isCustom,
  );

  Map<String, Object?> toMap() => {
    'id': id,
    'name': name,
    'emoji': emoji,
    'mealType': mealType,
    'calories': calories,
    'protein': protein,
    'fat': fat,
    'carbs': carbs,
    'fiber': fiber,
    'tags': tags.join(','),
    'region': region,
    'ingredients': ingredients,
    'steps': steps,
    'isFavorite': isFavorite ? 1 : 0,
    'isCustom': isCustom ? 1 : 0,
  };

  factory Food.fromMap(Map<String, Object?> m) => Food(
    id: m['id'] as String,
    name: m['name'] as String,
    emoji: m['emoji'] as String,
    mealType: m['mealType'] as String,
    calories: (m['calories'] as num).toDouble(),
    protein: (m['protein'] as num).toDouble(),
    fat: (m['fat'] as num).toDouble(),
    carbs: (m['carbs'] as num).toDouble(),
    fiber: (m['fiber'] as num).toDouble(),
    tags: splitCsv(m['tags']),
    region: m['region'] as String,
    ingredients: m['ingredients'] as String,
    steps: m['steps'] as String,
    isFavorite: (m['isFavorite'] as int) == 1,
    isCustom: (m['isCustom'] as int) == 1,
  );
}
