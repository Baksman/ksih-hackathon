import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String email;
  final bool emailVerified;
  final String uid;

  UserModel(
      {required this.email, required this.emailVerified, required this.uid});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email!,
      emailVerified: user.emailVerified,
      uid: user.uid,
    );
  }

  @override
  String toString() {
    return 'UserModel{email: $email, emailVerified: $emailVerified, uid: $uid}';
  }
}
