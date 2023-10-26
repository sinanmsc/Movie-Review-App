import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StrorageService {
  static final storageRef = FirebaseStorage.instance.ref();

  static Future<String> uploadProfileImage(XFile file, String userName) async {
    await storageRef.child("userProfile/$userName").putFile(File(file.path));
    return storageRef.child("userProfile/$userName").getDownloadURL();
  }
}
