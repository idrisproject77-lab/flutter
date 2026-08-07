import 'package:flutter/material.dart';

class TextfieldDay8 extends StatelessWidget {
  const TextfieldDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Masukan email anda!",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Masukan password anda!",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
