import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mindpoint/data/providers/notification.dart';

// /// Handles firebase Cloud Messaging background messages
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   // await Firebase.initializeApp();

//   log("Handling a background message: ${message.messageId}");
// }

class MessagingProvider {
  final NotificationProvider _notification;

  MessagingProvider(
    this._notification,
  );

  Future<void> init() async {
    FirebaseMessaging.instance.setAutoInitEnabled(true);

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle incoming messages when on foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;

      _notification.displayNotification(
        title: notification?.title ?? '',
        body: notification?.body ?? '',
      );
    });

    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    log('FIREBASE CLOUD MESSAGING TOKEN: ${await getToken()}');
  }

  Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}

final messagingProvider = Provider<MessagingProvider>((ref) {
  final notification = ref.watch(notificationProvider);
  return MessagingProvider(notification);
});
