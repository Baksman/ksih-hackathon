import 'package:flutter/material.dart';
import 'package:new_hackathon/firebase_service/auth_service.dart';
import 'package:new_hackathon/utilities/flushbar_utils.dart';
import 'package:new_hackathon/viewmodel/base_view_model.dart';

class AuthViewmodel extends BaseViewModel {
  final AuthService authService;
  final loginKey = GlobalKey<FormState>();
  final signUpKey = GlobalKey<FormState>();

  AuthViewmodel(this.authService);
  Future<bool> login(
      String email, String password, BuildContext context) async {
    setState(viewState: ViewState.busy);
    final result = await authService.login(email, password);
    setState(viewState: ViewState.done);
    if (result.hasError) {
      ShowFlushBar(
          subtitle: result.error.toString(), context: context, title: 'Error');
      return false;
    }

    return true;
    // return result;
  }

  Future<bool> signUp(String email, String password) async {
    setState(viewState: ViewState.busy);
    final result = await authService.signUp(email, password);
    await authService.sendVerification();
    setState(viewState: ViewState.done);
    if (result.hasError) {}
    return false;
  }
}
