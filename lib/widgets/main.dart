import 'package:crash/ui/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDxU4HxgbEs6PY1HVWbBl3feDzkoHxxxx",
      authDomain: "crash-66bf3.firebaseapp.com",
      projectId: "crash-66bxx",
      storageBucket: "crash-66bf3.appspot.com",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "1:239366924623:android:20e68df89a69c137ffxxxx",
      databaseURL: 'https://crash-66bf3-default-rtdb.asia-southeast1.firebasedatabasxxxx'
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       primarySwatch: Colors.purple,
     ),

     home: SplashScreen(),
   );
  }
}
