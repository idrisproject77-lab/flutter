import 'package:flutter/material.dart';
import 'input_interaktif.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InputInteraktif(),
    );
  }
}