import 'package:intl/intl.dart';

String dateKey(DateTime d) => DateFormat('yyyy-MM-dd').format(d);
DateTime dayOnly(DateTime d) => DateTime(d.year, d.month, d.day);
DateTime startOfWeek(DateTime d) =>
    dayOnly(d).subtract(Duration(days: d.weekday - 1));
List<String> splitCsv(Object? v) =>
    ((v as String?) ?? '').split(',').where((e) => e.isNotEmpty).toList();

const mealOrder = ['sang', 'trua', 'toi', 'phu'];
const mealLabels = {
  'sang': 'Bữa sáng',
  'trua': 'Bữa trưa',
  'toi': 'Bữa tối',
  'phu': 'Bữa phụ',
};
const activityLabels = [
  'Ít vận động (ngồi nhiều)',
  'Nhẹ (1-3 buổi/tuần)',
  'Vừa (3-5 buổi/tuần)',
  'Nhiều (6-7 buổi/tuần)',
  'Rất nhiều (VĐV, lao động nặng)',
];
const conditionLabels = {
  'diabetes': 'Tiểu đường',
  'hypertension': 'Cao huyết áp',
  'gout': 'Gout',
  'cholesterol': 'Mỡ máu cao',
};
const allergyLabels = {
  'seafood': 'Hải sản',
  'egg': 'Trứng',
  'milk': 'Sữa',
  'nut': 'Hạt/đậu phộng',
};
const regionLabels = {
  'bac': 'Miền Bắc',
  'trung': 'Miền Trung',
  'nam': 'Miền Nam',
};
const weekdayShort = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
