import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LifecycleService extends WidgetsBindingObserver {
  final WidgetRef ref;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  LifecycleService(this.ref);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // タイマーが動いているかどうかのフラグをProviderから取得（仮定）
    final isTimerRunning = false; // ref.read(timerRunningProvider);
    final isLookAwayPreventionEnabled = true; // ref.read(settingsProvider).isLookAwayPreventionEnabled;

    if (isTimerRunning && isLookAwayPreventionEnabled) {
      if (state == AppLifecycleState.inactive || state == AppLifecycleState.paused) {
        // バックグラウンドに回った瞬間に警告
        _showWarning();
      }
    }
  }

  Future<void> _showWarning() async {
    // 警告音再生
    await _audioPlayer.play(AssetSource('audio/warning.mp3'));

    // 通知送信
    const androidDetails = AndroidNotificationDetails(
      'look_away_warning',
      'Look Away Warning',
      importance: Importance.max,
      priority: Priority.high,
      fullScreenIntent: true,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);
    
    await _notifications.show(
      999,
      '集中が途切れています！',
      '今は集中時間です。アプリに戻ってください。',
      notificationDetails,
    );
  }
}
