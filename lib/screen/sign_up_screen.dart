import 'package:flutter/material.dart';
import 'package:new_hackathon/app_theme.dart/extension_utils.dart';
import 'package:new_hackathon/app_theme.dart/text_theme.dart';

import 'package:new_hackathon/app_theme.dart/them_colors.dart';
import 'package:new_hackathon/screen/home_screen.dart';
import 'package:new_hackathon/widgets/custom_raised_button.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.whirlPoolGreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Parrot Box',
                  style: kt20Green,
                ),
              ),
              24.verticalSpace,
              const Text(
                'Sign up',
                style: kt25White,
              ),
              30.verticalSpace,
              TextFormField(
                decoration: inputDecor.copyWith(labelText: 'Email'),
                style: kt20White,
              ),
              30.verticalSpace,
              TextFormField(
                decoration: inputDecor.copyWith(labelText: 'Password'),
                style: kt20White,
              ),
              30.verticalSpace,
              TextFormField(
                decoration: inputDecor.copyWith(labelText: 'Confirm password'),
                style: kt20White,
              ),
              30.verticalSpace,
              CustomRaisedButton(
                title: 'Sign up',
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                width: double.infinity,
              ),
              30.verticalSpace,
              CustomRaisedButton(
                title: 'Sign up with Google',
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecor = const InputDecoration(
    labelStyle: kt20White,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: ThemeColor.coldMorning),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: ThemeColor.coldMorning),
    ),
  );
}
