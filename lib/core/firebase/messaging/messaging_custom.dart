import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'local_notification_custom.dart';

class MessagingCustom {
  final LocalNotificationCustom _localNotification;

  MessagingCustom._internal(this._localNotification);
  static final MessagingCustom _singleton =
      MessagingCustom._internal(LocalNotificationCustom());
  factory MessagingCustom() => _singleton;

  Future<void> initialize({VoidCallback? callback}) async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (message.data['forceFetchRC'] != null) {
        callback?.call();
        return;
      }

      if (notification != null && android != null) {
        _localNotification.androidNotification(notification, android);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data['goTo'] != null) {
        Get.offNamed(message.data['goTo']);
      }
    });
  }

  getTokenFirebase() async {
    debugPrint(await FirebaseMessaging.instance.getToken());
  }
}
