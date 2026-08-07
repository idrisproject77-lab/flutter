import 'package:flutter/material.dart';

class HomeApaajaDay16 extends StatelessWidget {
  const HomeApaajaDay16({super.key, required this.email, this.password});
  final String email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(email), Text(password ?? 'Tidak ada password')],
      ),
    );
  }
}
