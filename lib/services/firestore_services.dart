import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static final db = FirebaseFirestore.instance;

  static Future<void> addUserData(
      String id, String name, String email, String? url) {
    final user = <String, dynamic>{
      "name": name,
      "email": email,
      "profileUrl": url,
    };
    return db.collection("users").doc(id).set(user);
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> readUserData(
      String uid) {
    return db.collection("users").doc(uid).get();
  }

  static Future<void> updateImage(String uid, String profileUrl) {
    return db.collection("users").doc(uid).update({"profileUrl": profileUrl});
  }
}
