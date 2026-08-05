import 'package:flutter/material.dart';

import 'data_olahraga.dart';

class TugasModelIdris extends StatelessWidget {
  const TugasModelIdris({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Peralatan Olahraga"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dataOlahraga.length,
        itemBuilder: (context, index) {
          final olahraga = dataOlahraga[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  olahraga.gambar,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                olahraga.nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(olahraga.deskripsi),
            ),
          );
        },
      ),
    );
  }
}
