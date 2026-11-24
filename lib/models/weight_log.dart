class WeightLog {
  final String date; // yyyy-MM-dd (mỗi ngày một bản ghi)
  final double weightKg;
  const WeightLog(this.date, this.weightKg);

  Map<String, Object?> toMap() => {'date': date, 'weightKg': weightKg};
  factory WeightLog.fromMap(Map<String, Object?> m) =>
      WeightLog(m['date'] as String, (m['weightKg'] as num).toDouble());
}
