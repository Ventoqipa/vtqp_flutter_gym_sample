class AccessRecord {
  // 1. Constructor primero
  const AccessRecord({
    required this.id,
    required this.date,
    required this.time,
    required this.location,
  });

  // 2. Variables después
  final String id;
  final String date;
  final String time;
  final String location;
}
