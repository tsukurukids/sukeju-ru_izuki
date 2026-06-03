import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class AppSettings {
  Id id = Isar.autoIncrement;

  bool isLookAwayPreventionEnabled = true;
  int taskLimit = 10;
  String defaultAlarmSound = 'default.mp3';
  String themeMode = 'auto'; // 'auto', 'spring', 'summer', 'autumn', 'winter'
  
  // 最後に「振り返り」を行った週の終了日
  DateTime? lastReflectionDate;

  AppSettings({
    this.isLookAwayPreventionEnabled = true,
    this.taskLimit = 10,
    this.defaultAlarmSound = 'default.mp3',
    this.themeMode = 'auto',
    this.lastReflectionDate,
  });
}
