import 'package:flutter/material.dart';

class Nama extends StatelessWidget {
  const Nama({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Idris Project",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Lokasi extends StatelessWidget {
  const Lokasi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, color: Colors.red),
          SizedBox(width: 10),
          Text("Jakarta, Indonesia"),
        ],
      ),
    );
  }
}

class Deskripsi extends StatelessWidget {
  const Deskripsi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Seorang peserta pelatihan yang sedang belajar Flutter di PPKD Jakarta Pusat.",
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}