import 'package:flutter/material.dart';

class HomeRoutingDay10 extends StatelessWidget {
  const HomeRoutingDay10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Day 11"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Homelechment"),
            ),
          ),
        ],
      ),
    );
  }
}