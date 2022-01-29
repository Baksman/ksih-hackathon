import 'package:get_it/get_it.dart';
import 'package:new_hackathon/firebase_service/auth_service.dart';
import 'package:new_hackathon/utilities/custom_validator.dart';
import 'package:new_hackathon/viewmodel/auth_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  getIt.registerFactory(() => AuthService(firebaseAuth));
  getIt.registerFactory(() => AuthViewmodel(getIt()));
  getIt.registerFactory(() => CustomValidator());
}
