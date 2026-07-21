import 'package:flutter/material.dart';
import 'layouting.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Saya"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 243, 68),
      ),
      body: const MyLayout(),
    );
  }
}