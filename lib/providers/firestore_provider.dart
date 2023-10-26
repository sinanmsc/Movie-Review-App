import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/services/firestore_services.dart';

final readUserProvider =
    FutureProvider.family<DocumentSnapshot<Map<String, dynamic>>, String>(
        (ref, uid) async {
  return FirestoreServices.readUserData(uid);
});

final uidProvider = StateProvider<String?>((ref) {
  return null;
});
