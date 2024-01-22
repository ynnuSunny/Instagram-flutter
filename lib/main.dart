import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/responsive_layout.dart';
import 'package:instagram_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBRWZpq8tE9vA4mINq27NOeqbrUT7c3UEI",
        projectId: "instagram-clone-97626",
        storageBucket: "instagram-clone-97626.appspot.com",
        messagingSenderId: "77154535424",
        appId: "1:77154535424:web:9d5d868592b721aa5c70e5"
    ));
  }else{
    Platform.isAndroid
        ? await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAGz25SMgUKgea2lf931nMDp4loduriPH0",
        appId: "1:77154535424:android:f63a5e0f2f77aa665c70e5",
        messagingSenderId: "77154535424",
        projectId: "instagram-clone-97626",
        storageBucket: "instagram-clone-97626.appspot.com",
      ),
    )
        : await Firebase.initializeApp();
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: const LoginScreen(),
    );
  }
}

