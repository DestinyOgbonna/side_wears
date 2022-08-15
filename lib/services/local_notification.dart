import 'package:building_ui/exports/exports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  LocalNotificationService();
  final _localNotificationService = FlutterLocalNotificationsPlugin();

  //* creating a stream to listen to the payloads evemt
  final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();
 //*Initializing the notification setting for the various device platforms//*Initializing the notification service and timezones
  Future<void> initialize() async { 
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_stat_download');

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReciveLocalNotification,
    );
    final InitializationSettings settingsIntialize = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _localNotificationService.initialize(settingsIntialize,
        onSelectNotification: onSelectedNotification);
  }

  //*Creating a function to hold the notification Details

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_Id', 'channel_name',
            importance: Importance.max,
            priority: Priority.max,
            channelDescription: 'Welcome channel',
            playSound: true);

    const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails();
    return const NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
  }

  //*Function to showNotification instantly

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);
  }
  //*Function to showNotification after a set period of time

  Future<void> showScheduledNotification({  String? payLoad}
   
  ) async {
    final details = await _notificationDetails();
    await _localNotificationService.zonedSchedule(
        1,
      'Welcome to Lord Wears',
        'Thanks for shopping with us',
        tz.TZDateTime.from(
            DateTime.now().add(const Duration(seconds: 4)), tz.local),
        details,
        androidAllowWhileIdle: true, payload: payLoad,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }


// Future<void> periodicallyShow(
//   int id,
//   String? title,
//   String? body,
//   RepeatInterval repeatInterval,
//   NotificationDetails notificationDetails, {
//   String? payload,
//   bool androidAllowWhileIdle = false,
// }) async {
//   if (kIsWeb) {
//     return;
//   }
//   if (defaultTargetPlatform == TargetPlatform.android) {
//     await resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.periodicallyShow(id, title, body, repeatInterval,
//             notificationDetails: notificationDetails.android,
//             payload: payload,
//             androidAllowWhileIdle: androidAllowWhileIdle);
//   } else if (defaultTargetPlatform == TargetPlatform.iOS) {
//     await resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.periodicallyShow(id, title, body, repeatInterval,
//             notificationDetails: notificationDetails.iOS, payload: payload);
//   } else if (defaultTargetPlatform == TargetPlatform.macOS) {
//     await resolvePlatformSpecificImplementation<
//             MacOSFlutterLocalNotificationsPlugin>()
//         ?.periodicallyShow(id, title, body, repeatInterval,
//             notificationDetails: notificationDetails.macOS, payload: payload);
//   } else {
//     await FlutterLocalNotificationsPlatform.instance
//         .periodicallyShow(id, title, body, repeatInterval);
//   }
// }
  //*Function to showNotification instantly

  Future<void> showNotificationPayLoad(
      {required int id,
      required String title,
      required String body,
      required String payLoad}) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details,
        payload: payLoad);
  }

  void _onDidReciveLocalNotification(
      int id, String? title, String? body, String? payLoad) {
    print('id $id');
  }

  void onSelectedNotification(String? payload) {
    print(payload);

    if (payload != null && payload.isNotEmpty) {
      onNotificationClick.add(payload);
    }
  }
}
