import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:traval/core/utils/local_storage.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

abstract class NotificationService {
  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  static void init() {
    getNotificationPermission();
    firebaseMessagingInit();
    getMessage();
  }

  static Future getNotificationPermission() async {
    await FirebaseMessaging.instance.requestPermission().then((value) {
      FirebaseMessaging.instance.getToken().then((token) {
        storeDeviceInformation(token);
      });
    });
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static void firebaseMessagingInit() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher');

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      // onDidReceiveNotificationResponse: onSelectNotification,
    );
    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  // static Future<void> firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   LocalStorage.incrementCount();
  //   await Firebase.initializeApp();
  //   print(
  //       '-=-=-=-=-=-=-> Handling a background message ${message.messageId} <-=-=-=-=-=-=-');
  // }

  // static Future<dynamic> onSelectNotification(String? payload) async {
  //   print("-=-=-=-=-=-=-> onSelectNotification <-=-=-=-=-=--=-");
  //   print(payload.toString());
  //   navigation(payload.toString());
  //   getNotificationCounter().then((e) {
  //     if (e! >= 1) {
  //       CounterStorage().writeCounter(e - 1);
  //     }
  //   });
  // }

  static void getMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // KILL APP
    FirebaseMessaging.instance.getInitialMessage();

    // BACKGROUND
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {});
    // OPEN APP
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage? message) {
        if (message != null) {
          showNotification(notification: message.notification);
        } else {
          print("onMessage NULL");
        }
      },
    );
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      badge: true,
      alert: true,
      sound: true,
    );
    if (Platform.isAndroid) {
      FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    }
  }

  static Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  static Future<void> showNotification(
      {RemoteNotification? notification}) async {
    var android = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      priority: Priority.high,
      importance: Importance.max,
    );
    // var platform = NotificationDetails(android: android);
    // await flutterLocalNotificationsPlugin.show(
    //   notification.hashCode,
    //   notification?.title,
    //   notification?.body,
    //   platform,
    // );
  }

  static Future<void> storeDeviceInformation(fcmToken) async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      // unique ID on iOS
      LocalStorage.storeDeviceInfo(
        iosDeviceInfo.identifierForVendor?.toString() ?? '',
        fcmToken,
        "ios",
      );
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      // unique ID on Android
      LocalStorage.storeDeviceInfo(
          androidDeviceInfo.id?.toString() ?? '', fcmToken, "android");
    }
  }
}
