import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore firestore;

  DatabaseService(this.firestore);

  Future<void> saveUserInfo(String? name, String? imageUrl, String uid) async {
    await firestore
        .collection('user')
        .doc(uid)
        .set({"user": name, "uid": uid, "imageUrl": imageUrl});
  }
}
