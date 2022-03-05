import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:new_hackathon/routes.dart';
import 'package:new_hackathon/screen/home_screen.dart';
import 'package:new_hackathon/screen/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'di.dart';
import 'firebase_service/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setup();
  runZoned(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Gold',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      home: ScreenUtilInit(
        builder: () => StreamBuilder<User?>(
            stream: getIt.get<AuthService>().onAuthStateChanged,
            builder: (context, snapshot) {
              // print(snapshot.data);
              // print(snapshot.requireData);
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingScreen();
              } else {
                return snapshot.data == null
                    ? const StartScreen()
                    : const HomeScreen();
              }
            }),
      ),
    );
  }
}
// HomeScreen

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
