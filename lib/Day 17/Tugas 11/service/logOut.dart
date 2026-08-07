import 'package:flutter/material.dart';
import 'package:flutter_application_1/Day%2017/Tugas%2011/service/preference_handler.dart';
import 'package:flutter_application_1/Tugas6_Idris/login_page.dart';
import 'package:flutter_application_1/extension/navigator.dart';

class LogoutTugas11 extends StatefulWidget {
  const LogoutTugas11({super.key});

  @override
  State<LogoutTugas11> createState() => _LogoutTugas11State();
}

class _LogoutTugas11State extends State<LogoutTugas11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            heightFactor: 10,
            child: ElevatedButton(
              onPressed: () {
                PreferenceHandler.logOut();
                context.pushAndRemoveAll(const LoginPage());
              },
              child: Text('LogOut'),
            ),
          ),
        ],
      ),
    );
  }
}
