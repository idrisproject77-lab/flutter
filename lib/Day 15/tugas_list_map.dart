import 'package:flutter/material.dart';

class TugasListMapIdris extends StatelessWidget {
  TugasListMapIdris({super.key});

  List<Map<String, dynamic>> dataOlahraga = [
    {"nama": "Sepak Bola", "harga": 250000, "icon": Icons.sports_soccer},
    {"nama": "Bola Basket", "harga": 300000, "icon": Icons.sports_basketball},
    {"nama": "Bola Voli", "harga": 200000, "icon": Icons.sports_volleyball},
    {"nama": "Raket Badminton", "harga": 450000, "icon": Icons.sports_tennis},
    {"nama": "Raket Tenis", "harga": 700000, "icon": Icons.sports_tennis},
    {"nama": "Dumbbell", "harga": 180000, "icon": Icons.fitness_center},
    {"nama": "Matras Yoga", "harga": 150000, "icon": Icons.self_improvement},
    {"nama": "Sarung Tinju", "harga": 220000, "icon": Icons.sports_mma},
    {"nama": "Sepatu Futsal", "harga": 550000, "icon": Icons.sports_soccer},
    {
      "nama": "Botol Minum Sport",
      "harga": 80000,
      "icon": Icons.sports_gymnastics,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peralatan Olahraga'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dataOlahraga.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dataOlahraga[index]["nama"]),
            leading: Icon(dataOlahraga[index]['icon']),
            subtitle: Text('Harga : Rp ${dataOlahraga[index]['harga']}'),
          );
        },
      ),
    );
  }
}
