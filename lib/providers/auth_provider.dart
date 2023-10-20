import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/services/auth_services.dart';

final authServicesProvider = Provider<AuthServices>((ref) {
  return AuthServices();
});

final authStatusProvider = StreamProvider<User?>((ref) {
  return ref.read(authServicesProvider).authStateChange();
});
