/// https://pub.dev/packages/flutter_local_notifications#macos-differences
/// https://medium.com/flutter-community/local-notifications-in-flutter-746eb1d606c6

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

// ignore: constant_identifier_names
const DEFAULT_NOTIFICATION_ID = 'mindpoint:notification:id:default';

// ignore: constant_identifier_names
const DEFAULT_NOTIFICATION_CHANNEL = 'mindpoint:notification:channel:default';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationProvider {
  static final NotificationProvider _notificationService =
      NotificationProvider._internal();

  factory NotificationProvider() {
    return _notificationService;
  }

  NotificationProvider._internal();

  Future selectNotification(NotificationResponse payload) async {
    //Handle notification tapped logic here
  }

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/ic_stat_mindpoint_icon_launcher');

    // final IOSInitializationSettings initializationSettingsIOS =
    //     IOSInitializationSettings(
    //   requestSoundPermission: false,
    //   requestBadgePermission: false,
    //   requestAlertPermission: false,
    //   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    // );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsIOS,
      // macOS: null,
    );

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: selectNotification,
      // onDidReceiveBackgroundNotificationResponse:
      //     NotificationService.selectNotification,
    );
  }

  Future<void> displayNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      DEFAULT_NOTIFICATION_ID, DEFAULT_NOTIFICATION_CHANNEL,
      color: Color.fromARGB(255, 0, 0, 0),
      channelDescription: 'batata', //Required for Android 8.0 or after
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(1, title, body, details);
  }

  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduleDate,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      DEFAULT_NOTIFICATION_ID,
      DEFAULT_NOTIFICATION_CHANNEL,
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduleDate, tz.local),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}

final notificationProvider =
    Provider<NotificationProvider>((ref) => NotificationProvider());
