import 'package:isar/isar.dart';

part 'reflection.g.dart';

@collection
class WeeklyReflection {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late DateTime weekEndDate; // 金曜日の日付
  
  late int score; // 10点満点
  late String feedback;

  WeeklyReflection({
    required this.weekEndDate,
    required this.score,
    required this.feedback,
  });
}
