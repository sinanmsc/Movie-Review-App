import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/providers/auth_provider.dart';
import 'package:movieapp/providers/firestore_provider.dart';
import 'package:movieapp/view/home_page.dart';
import 'package:movieapp/view/sign/login.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStatusProvider).when(
          data: (data) {
            if (data == null) {
              return Login();
            } else {
              Future.delayed(
                Duration.zero,
              ).then(
                (value) => ref.read(uidProvider.notifier).state = data.uid,
              );
              log(data.uid);
              return HomePage(
                uid: data.uid,
              );
            }
          },
          error: (error, stackTrace) => Center(
            child: Text('$error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
