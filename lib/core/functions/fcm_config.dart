import 'package:e_commerce_app/controller/orders/pending_controller.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestNotificationPermission()async
{
  NotificationSettings settings=await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig()
{

  FirebaseMessaging.onMessage.listen((remoteMessage) {
    Get.snackbar(remoteMessage.notification!.title!, remoteMessage.notification!.body!);
    FlutterRingtonePlayer.playNotification();
    refreshPageNotification(remoteMessage.data);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
    Get.toNamed(AppRoutes.orders);
  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message)async
{
  await Firebase.initializeApp();
}

refreshPageNotification(data)
{

  if(Get.currentRoute=="/orders" && data['pagename']=="refreshOrderPending")
    {
      PendingController controller=Get.find();
      controller.getData();
    }

  /// ways to do realtime updating
  /// firebase + stream
  /// socket io
  /// notification
}

/*
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

FlutterRingtonePlayer.play(
  android: AndroidSounds.notification,
  ios: IosSounds.glass,
  looping: true, // Android only - API >= 28
  volume: 0.1, // Android only - API >= 28
  asAlarm: false, // Android only - all APIs
);

FlutterRingtonePlayer.play(fromAsset: "assets/ringtone.wav");

FlutterRingtonePlayer.play(
 fromAsset: "assets/ringtone.wav", // will be the sound on Android
 ios: IosSounds.glass 			   // will be the sound on iOS
 );


 */