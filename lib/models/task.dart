import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;

  late String title;
  late String memo;
  late String location;
  
  @Index()
  late DateTime scheduledTime;
  
  late String alarmSoundPath;
  late bool isAlarmEnabled;
  
  @Index()
  DateTime? deletedAt;
  
  late int orderIndex;

  Task({
    required this.title,
    required this.memo,
    required this.location,
    required this.scheduledTime,
    this.alarmSoundPath = 'default.mp3',
    this.isAlarmEnabled = true,
    this.deletedAt,
    this.orderIndex = 0,
  });
}
