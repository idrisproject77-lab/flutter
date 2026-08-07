import 'package:flutter/material.dart';

class ContohStatefull extends StatefulWidget {
  const ContohStatefull({super.key});

  @override
  State<ContohStatefull> createState() => _ContohStatefullState();
}

class _ContohStatefullState extends State<ContohStatefull> {
  int counter = 0;

  bool showImage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),

          ElevatedButton(
            onPressed: () {
              debugPrint('Notifikasi Debug Console');
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("CLICK HERE")));
            },
            child: Text("CLICK HERE "),
          ),

          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print("Ikon Klik");
            },
          ),

          TextButton(
            onPressed: () {
              debugPrint("Text Booton");
            },
            child: Text('Baca Selengkapnya'),
          ),

          GestureDetector(
            onTap: () {
              print("Disentuh sekali");
            },
            onDoubleTap: () {
              print("Disentuh dua kali");
            },
            onLongPress: () {
              print("Tahan lama");
            },
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16),
              child: Text("Click Here", style: TextStyle(color: Colors.white)),
            ),
          ),

          FloatingActionButton(
            onPressed: () {
              debugPrint("FAB  Ditekan");
            },
            tooltip: "Tambah Data",
            child: Icon(Icons.add),
          ),

          // InkWell(
          //   onTap: () {
          //     debugPrint("Text Booton");
          //   },
          //   child: Text('The One Piece is Real'),
          // ),
          ElevatedButton(
            onPressed: () {
              // Langkah 6: Tambahkan setState di dalam fungsi aksi
              setState(() {
                counter++; // Memperbarui nilai state
              });
            },
            child: Text("Tambah"),
          ),
        ],
      ),
    );
  }
}
