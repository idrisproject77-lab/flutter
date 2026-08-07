import 'package:flutter/material.dart';

class ImageContainerDay6 extends StatelessWidget {
  const ImageContainerDay6({super.key});  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Container Day 6'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 1000,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/WhatsApp Image 2026-07-22 at 11.39.29 AM.jpeg')
              )
            ),
          )
        ],
      ),
    );
  }
}