import 'package:flutter/material.dart';
import 'styling.dart';

class MyLayout extends StatelessWidget {
  const MyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Nama(),
          SizedBox(height: 10),
          Lokasi(),
          SizedBox(height: 15),
          Deskripsi(),
        ],
      ),
    );
  }
}