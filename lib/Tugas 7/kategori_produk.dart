import 'package:flutter/material.dart';

class KategoriProduk extends StatefulWidget {
  const KategoriProduk({super.key});

  @override
  State<KategoriProduk> createState() => _KategoriProdukState();
}

class _KategoriProdukState extends State<KategoriProduk> {
  String? kategori;

  List<String> daftarKategori = ["Elektronik", "Pakaian", "Makanan", "Lainnya"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pilih Kategori",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          DropdownButton<String>(
            value: kategori,
            hint: const Text("Pilih Kategori"),

            isExpanded: true,

            items: daftarKategori.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),

            onChanged: (value) {
              setState(() {
                kategori = value;
              });
            },
          ),

          const SizedBox(height: 20),

          Text(
            "Anda memilih kategori : ${kategori ?? '-'}",
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
