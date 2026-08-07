import 'package:flutter/material.dart';
import 'package:flutter_application_1/Day%2013/bottom.dart';
import 'package:flutter_application_1/Day%2017/Tugas%2011/login_idris.dart';
import 'package:flutter_application_1/Day%2017/Tugas%2011/service/preference_handler.dart';
import 'package:flutter_application_1/Day%2017/service/preference_handler.dart';
import 'package:lottie/lottie.dart';

// Widget SplashScreenDay17 berupa StatefulWidget untuk menangani proses async (delay & pengecekan session login saat awal aplikasi dibuka).
class SplashScreenDay17 extends StatefulWidget {
  const SplashScreenDay17({super.key});

  @override
  State<SplashScreenDay17> createState() => _SplashScreenDay17State();
}

class _SplashScreenDay17State extends State<SplashScreenDay17> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    if (PreferenceHandler.isLogin == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomDay13()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/animation/splash.json")),
    );
  }
}
