import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationService()
      : flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin() {
    _initialize();
  }

  Future<void> _initialize() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app/src/main/res/drawable/app_icon.png');
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
