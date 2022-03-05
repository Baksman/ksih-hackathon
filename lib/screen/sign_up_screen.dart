import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_hackathon/app_theme.dart/extension_utils.dart';
import 'package:new_hackathon/app_theme.dart/text_theme.dart';

import 'package:new_hackathon/app_theme.dart/them_colors.dart';
import 'package:new_hackathon/screen/home_screen.dart';
import 'package:new_hackathon/utilities/custom_validator.dart';
import 'package:new_hackathon/viewmodel/auth_viewmodel.dart';
import 'package:new_hackathon/viewmodel/base_view_model_builder.dart';
import 'package:new_hackathon/widgets/custom_raised_button.dart';
import '../di.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.whirlPoolGreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BaseViewBuilder<AuthViewmodel>(
          model: getIt(),
          builder: (authVm, child) {
            return Form(
              key: authVm.signUpKey,
              child: SingleChildScrollView(
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
                        controller: _emailController,
                        decoration: inputDecor.copyWith(labelText: 'Email'),
                        style: kt20White,
                        validator: getIt.get<CustomValidator>().emailValidator,
                      ),
                      30.verticalSpace,
                      TextFormField(
                        validator: (val) {
                          if (val == null) return 'invalid password';
                          if (val.trim().length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          password = val;
                          return null;
                        },
                        controller: _passwordController,
                        decoration: inputDecor.copyWith(labelText: 'Password'),
                        style: kt20White,
                      ),
                      30.verticalSpace,
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (val) {
                          if (val != password) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        decoration:
                            inputDecor.copyWith(labelText: 'Confirm password'),
                        style: kt20White,
                      ),
                      30.verticalSpace,
                      authVm.isBusy
                          ? const Center(child: CupertinoActivityIndicator())
                          : CustomRaisedButton(
                              title: 'Sign up',
                              onPressed: () async {
                                if (!authVm.signUpKey.currentState!
                                    .validate()) {
                                  return;
                                }
                                final result = await authVm.signUp(
                                    getIt.get<CustomValidator>().email ?? '',
                                    password!,
                                    context);
                                if (result) {
                                  Navigator.pushReplacementNamed(
                                      context, HomeScreen.routeName);
                                }
                              },
                              width: double.infinity,
                            ),
                      30.verticalSpace,
                      // authVm.isBusy
                      //     ? const Offstage()
                      //     : CustomRaisedButton(
                      //         title: 'Sign up with Google',
                      //         onPressed: () {
                      //           Navigator.pushNamed(
                      //               context, HomeScreen.routeName);
                      //         },
                      //         width: double.infinity,
                      //       ),
                    ],
                  ),
                ),
              ),
            );
          }),
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
