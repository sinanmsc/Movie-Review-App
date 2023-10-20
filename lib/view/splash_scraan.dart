import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:movieapp/view/sign/auth_checker.dart';
import 'package:movieapp/view/sign/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateHome();
    super.initState();
    FlutterNativeSplash.remove();
  }

  void navigateHome() async {
    await Future.delayed(
      const Duration(milliseconds: 2350),
    );

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthChecker(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF31bbc5),
      body: Center(
        child: Image.asset('assets/tumblr_njf7pgwIk51red0apo1_r1_1280.gif'),
      ),
    );
  }
}
