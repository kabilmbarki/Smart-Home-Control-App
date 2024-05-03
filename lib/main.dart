import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home/LoginPage.dart';
import 'package:home/api/firebase_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:179166282829:android:723f5ce97721c96f778804',
      apiKey: 'AIzaSyCbBVdAeMb-U1cXsWPEqO9M4Jre2i0icck',
      projectId: 'finalapp-c667d',
      messagingSenderId: '179166282829',
      // Add other necessary options as needed
    ),
  );
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: LoginPage(),
    );
  }
}
