import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_notification/api/firebase_api.dart';
import 'package:flutter_firebase_notification/firebase_options.dart';
import 'package:flutter_firebase_notification/pages/notif_page.dart';

import 'pages/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  runApp(const FirebasePushNotificationApp());
}

class FirebasePushNotificationApp extends StatelessWidget {
  const FirebasePushNotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_screen': (context) => const NotifPage(),
      },
    );
  }
}
