import 'package:flutter/material.dart';
import 'package:new_hackathon/screen/home_screen.dart';
import 'package:new_hackathon/screen/login_screen.dart';
import 'package:new_hackathon/screen/sign_up_screen.dart';
import 'package:new_hackathon/screen/start_screen.dart';

final Map<String, WidgetBuilder> routes = {
  StartScreen.routeName: (_) {
    return const StartScreen();
  },
  LoginScreen.routeName: (_) {
    return const LoginScreen();
  },
  SignupScreen.routeName: (_) {
    return const SignupScreen();
  },
  HomeScreen.routeName: (_) {
    return const HomeScreen();
  }
};
