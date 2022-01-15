import 'package:flutter/material.dart';
import 'package:new_hackathon/app_theme.dart/extension_utils.dart';
import 'package:new_hackathon/app_theme.dart/text_theme.dart';
import 'package:new_hackathon/app_theme.dart/them_colors.dart';
import 'package:new_hackathon/screen/login_screen.dart';

class StartScreen extends StatelessWidget {
  static const routeName = '/start-screen';
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.mintChiffon,
      body: SizedBox(
          height: context.getDeviceHeight,
          width: context.getDeviceWidth,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Image.asset(
                  'assets/images/start_bubble.png',
                  width: context.getDeviceWidth / 2.0,
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/start_image.png',
                  width: context.getDeviceWidth / 1.5,
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, LoginScreen.routeName),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        height: 35,
                        width: 210,
                        child: Row(
                          children: [
                            Image.asset('assets/images/smile_emoji.png'),
                            10.horizontalSpace,
                            const Text(
                              'Welcome in',
                              style: kt20White,
                            ),
                            10.horizontalSpace,
                            Image.asset('assets/images/send.png'),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: ThemeColor.attorney,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  )),
            ],
          )),
    );
  }
}
