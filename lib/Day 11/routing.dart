import 'package:flutter/material.dart';
import 'package:flutter_application_1/Day%2011/home.dart';

class RoutingDay11 extends StatelessWidget {
  const RoutingDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routing Day 11"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeRoutingDay10()),
                );
              },
              child: Text("Phush"),
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeRoutingDay10()),
                );
              },
              child: Text("PushReplechment"),
            ),
          ),
        ],
      ),
    );
  }
}
