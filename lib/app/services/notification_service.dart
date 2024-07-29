// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:event_bus/event_bus.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
//
// late AndroidNotificationChannel channel;
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
// EventBus eventNotification = EventBus.customController(BehaviorSubject());
//
// class PushNotificationsService {
//   static final _firebaseMessaging = FirebaseMessaging.instance;
//
//   static String? fcmToken;
//   static late Function(String? notificationType) onNavigate;
//   static late Function(String? notificationType) onMessage;
//
//   static Future init({
//     required Function(String fcm) fcmTokenUpdate,
//     required Function(String? type) onNavigateInApp,
//     required Function(String? notificationType) onMessageInApp,
//   }) async {
//     onNavigate = onNavigateInApp;
//     onMessage = onMessageInApp;
//     if (Platform.isIOS) {
//       final NotificationSettings settings =
//           await _firebaseMessaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );
//       if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//         log('User granted permission');
//       } else if (settings.authorizationStatus ==
//           AuthorizationStatus.provisional) {
//         log('User granted provisional permission');
//       } else {
//         log('User declined or has not accepted permission');
//       }
//     }
//
//     await initNotificationChannelsAndonBackgroundMessage();
//
//     fcmTokenUpdate(await setupNotifications());
//     log('Notification Intiated ...');
//   }
//
//   static void onReceiveNotificationResponse(NotificationResponse details) =>
//       onNavigate(details.payload);
//
//   static Future<String> setupNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     if (!(await FirebaseMessaging.instance.isSupported())) return '';
//     fcmToken = await _firebaseMessaging.getToken();
//     FirebaseMessaging.onMessage.listen(
//       (event) async {
//         if (Platform.isIOS) {
//           onMessage(event.data['type'] as String?);
//           await FirebaseMessaging.instance
//               .setForegroundNotificationPresentationOptions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//         }
//         if (Platform.isAndroid) {
//           await flutterLocalNotificationsPlugin.cancelAll();
//           await flutterLocalNotificationsPlugin.initialize(
//             const InitializationSettings(
//               android: AndroidInitializationSettings('@mipmap/launcher_icon'),
//               iOS: DarwinInitializationSettings(),
//             ),
//             onDidReceiveBackgroundNotificationResponse:
//                 onReceiveNotificationResponse,
//             onDidReceiveNotificationResponse: onReceiveNotificationResponse,
//           );
//           await firebaseInAppNotificationHandler(event);
//         }
//       },
//     );
//     await FirebaseMessaging.instance
//         .getInitialMessage()
//         .then(onNotificationAction);
//     FirebaseMessaging.onMessageOpenedApp.listen(onNotificationAction);
//     return fcmToken!;
//   }
//
// //<editor-fold desc="------------Handling Functions">
//   static Future<void> onNotificationAction(RemoteMessage? event) async {
//     if (event != null) {
//       onNavigate(event.data['type'] as String?);
//     }
//   }
//
//   static Future firebaseInAppNotificationHandler(RemoteMessage event) async {
//     log('firebaseInAppNotificationHandler', name: ' Notification ');
//     onMessage(event.data['type'].toString());
//     final notification = event.notification;
//     if (notification?.android != null) {
//       await showNotification(
//         id: 0,
//         title: notification!.title,
//         body: notification.body,
//         payload: event.data['type'].toString(),
//       );
//     }
//   }
//
//   static Future<void> firebaseMessagingNotificationHandler(
//     RemoteMessage event,
//   ) async {
//     final notification = event.notification;
//     if (notification?.android != null) {
//       await showNotification(
//         id: notification.hashCode,
//         title: notification!.title,
//         body: notification.body,
//         payload: event.data['type'].toString(),
//       );
//     }
//   }
//
//   static Future<void> showNotification({
//     required int id,
//     required String? title,
//     required String? body,
//     required String? payload,
//   }) =>
//       flutterLocalNotificationsPlugin.show(
//         id,
//         title,
//         body,
//         NotificationDetails(
//           android: getAndroidNotificationDetails(),
//           iOS: const DarwinNotificationDetails(),
//         ),
//         payload: payload,
//       );
//
//   static AndroidNotificationDetails getAndroidNotificationDetails() {
//     const String filePath = 'assets/images/logo/app_icon.png';
//     const BigPictureStyleInformation bigPictureStyleInformation =
//         BigPictureStyleInformation(
//       FilePathAndroidBitmap(filePath),
//       largeIcon: FilePathAndroidBitmap(filePath),
//     );
//     return AndroidNotificationDetails(
//       channel.id,
//       channel.name,
//       channelDescription: channel.description,
//       priority: Priority.high,
//       importance: Importance.max,
//       styleInformation: bigPictureStyleInformation,
//     );
//   }
//
//   // static Future<void> subscribeToGuest() async {
//   //   log('subscribeToGuest', name: ' Notification ');
//   //   await _firebaseMessaging.unsubscribeFromTopic('user');
//   //   await _firebaseMessaging.unsubscribeFromTopic('owner');
//   //   await _firebaseMessaging.subscribeToTopic('guest');
//   //   await _firebaseMessaging.subscribeToTopic('all');
//   // }
//   //
//   // static Future<void> subscribeToOwner() async {
//   //   log('subscribeToOwner', name: ' Notification ');
//   //   await _firebaseMessaging.unsubscribeFromTopic('user');
//   //   await _firebaseMessaging.unsubscribeFromTopic('guest');
//   //   await _firebaseMessaging.subscribeToTopic('owner');
//   //   await _firebaseMessaging.subscribeToTopic('all');
//   // }
//   // static Future<void> subscribeToUser() async {
//   //   log('subscribeFromUser', name: ' Notification ');
//   //   await _firebaseMessaging.unsubscribeFromTopic('owner');
//   //   await _firebaseMessaging.unsubscribeFromTopic('guest');
//   //   await _firebaseMessaging.subscribeToTopic('user');
//   //   await _firebaseMessaging.subscribeToTopic('all');
//   // }
//
//   static Future<void> subscribeToGuest() async {
//     await _firebaseMessaging.subscribeToTopic('guest');
//     await _firebaseMessaging.subscribeToTopic('all');
//   }
//
//   static Future<void> unsubscribeFromGuest() async {
//     await _firebaseMessaging.unsubscribeFromTopic('guest');
//     await _firebaseMessaging.unsubscribeFromTopic('all');
//   }
//
//   PushNotificationsService._();
//
// //</editor-fold>
// }
//
// typedef NotificationsPlugin = AndroidFlutterLocalNotificationsPlugin;
//
// Future<void> initNotificationChannelsAndonBackgroundMessage() async {
//   if (Platform.isAndroid) {
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel', // id
//       'High Importance Notifications', // title
//       description: 'This channel is used for important notifications.',
//       importance: Importance.high,
//     );
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<NotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   } else if (Platform.isIOS) {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//   FirebaseMessaging.onBackgroundMessage(
//     PushNotificationsService.firebaseMessagingNotificationHandler,
//   );
// }
