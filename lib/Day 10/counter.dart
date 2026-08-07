import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ImageDay10 extends StatefulWidget {
  const ImageDay10({super.key});

  @override
  State<ImageDay10> createState() => _ImageDay10State();
}

class _ImageDay10State extends State<ImageDay10> {
  bool showImage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image day 10"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          showImage
              ? Image.asset("assets/images/3.jpg", height: 200)
              : Image.asset("assets/images/3.jpg", height: 200),
          Container(
            color: const Color.fromARGB(255, 33, 243, 44),
            height: 100,
            width: 100,
          ),
          showImage
              ? Image.asset("assets/images/5.jpg", height: 200)
              : Image.network("assets/images/3.jpg", height: 200),
          Shimmer(
            child: Container(color: Colors.blue, height: 200, width: 200),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
              showImage = !showImage;
            },
            child: Text(showImage ? "sembunyikan" : "Tampilkan"),
          ),
        ],
      ),
    );
  }
}
