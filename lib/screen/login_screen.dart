import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_hackathon/app_theme.dart/extension_utils.dart';
import 'package:new_hackathon/app_theme.dart/text_theme.dart';
import 'package:new_hackathon/app_theme.dart/them_colors.dart';
import 'package:new_hackathon/screen/home_screen.dart';
import 'package:new_hackathon/screen/sign_up_screen.dart';
import 'package:new_hackathon/utilities/custom_validator.dart';
import 'package:new_hackathon/viewmodel/auth_viewmodel.dart';
import 'package:new_hackathon/viewmodel/base_view_model_builder.dart';
import 'package:new_hackathon/widgets/custom_raised_button.dart';
import '../di.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseViewBuilder<AuthViewmodel>(
        model: getIt(),
        builder: (authVm, child) {
          return Scaffold(
            backgroundColor: ThemeColor.whirlPoolGreen,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Form(
              key: authVm.loginKey,
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
                        'Login',
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
                        controller: _passwordController,
                        validator:
                            getIt.get<CustomValidator>().passwordValidator,
                        decoration: inputDecor.copyWith(labelText: 'Password'),
                        style: kt20White,
                      ),
                      30.verticalSpace,
                      authVm.isBusy
                          ? const Center(child: CupertinoActivityIndicator())
                          : CustomRaisedButton(
                              title: 'Login',
                              onPressed: () async {
                                if (!authVm.loginKey.currentState!.validate()) {
                                  return;
                                }
                                final result = await authVm.login(
                                    getIt.get<CustomValidator>().email ?? '',
                                    getIt.get<CustomValidator>().password ?? '',
                                    context);
                                if (result) {
                                  _passwordController.clear();
                                  Navigator.pushReplacementNamed(
                                      context, HomeScreen.routeName);
                                } else {}
                              },
                              width: double.infinity,
                            ),
                      30.verticalSpace,
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, SignupScreen.routeName),
                        child: const Center(
                            child: Text(
                          'Sign up',
                          style: kt16White,
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
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
