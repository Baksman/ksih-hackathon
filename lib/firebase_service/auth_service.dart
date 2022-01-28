import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_hackathon/model/api_base_response.dart';
import 'package:new_hackathon/model/failure.dart';
import 'package:new_hackathon/model/user_model.dart';

class AuthService {
  final FirebaseAuth firebaseAuth;

  AuthService(this.firebaseAuth);

  // Future<FirebaseUser> getCurrentUser() async {
  //   FirebaseUser user = await firebaseAuth.getCurrentUser;
  //   return user;
  // }

  Future<ApiResponse<UserModel>> signUp(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return ApiResponse(data: UserModel.fromFirebaseUser(result.user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ApiResponse(
          error: ServerFailure(error: 'The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        return ApiResponse(
          error: ServerFailure(
              error: 'The account already exists for that email.'),
        );
      }
      return ApiResponse(
        error: ServerFailure(error: e.code),
      );
    } catch (e) {
      return ApiResponse(
        error: ServerFailure(error: e.toString()),
      );
    }
  }

  Future<bool> isLoggedIn() async {
    var user = firebaseAuth.currentUser;
    return user != null;
  }

  Future<void> signout() async {
    await firebaseAuth.signOut();
  }

  Future<ApiResponse<UserModel>> login(String email, String password) async {
    try {
      UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return ApiResponse(data: UserModel.fromFirebaseUser(result.user!));

      // return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ApiResponse(
          error: ServerFailure(error: 'The password provided is too weak.'),
        );
      } else if (e.code == 'wrong-password') {
        return ApiResponse(
          error: ServerFailure(error: 'The password provided is too weak.'),
        );
      }
      return ApiResponse(
        error: ServerFailure(error: e.code),
      );
    } catch (e) {
      return ApiResponse(
        error: ServerFailure(error: e.toString()),
      );
    }
  }

  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  Future<void> sendVerification() async {
    final user = getCurrentUser();
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
