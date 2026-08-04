import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas%207/atur_pengingat.dart';
import 'package:flutter_application_1/Tugas%207/chekbox.dart';
import 'package:flutter_application_1/Tugas%207/dark_mode.dart';
import 'package:flutter_application_1/Tugas%207/kategori_produk.dart';
import 'package:flutter_application_1/Tugas%207/pilih_tanggal.dart';

class InputInteraktif extends StatefulWidget {
  const InputInteraktif({super.key});

  @override
  State<InputInteraktif> createState() => _InputInteraktifState();
}

class _InputInteraktifState extends State<InputInteraktif> {
  bool isAgree = false;
  int _selectedBottom = 0;

  void changeBottom(int index) {
    _selectedBottom = index;
    setState(() {});
  }

  final List<Widget> _widgetOptions = [
    CheckBoxTugas(),
    DarkMode(),
    KategoriProduk(),
    PilihTanggal(),
    AturPengingat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 5,
        title: const Text(
          "Input Interaktif",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.person, color: Colors.white, size: 60),

                  SizedBox(height: 10),

                  Text(
                    "Menu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text("Syarat & Ketentuan"),
              onTap: () {
                setState(() {
                  _selectedBottom = 0;
                });
                changeBottom(0);
              },
            ),

            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text("Mode Tampilan"),
              onTap: () {
                setState(() {
                  _selectedBottom = 1;
                });
                changeBottom(1);
              },
            ),

            ListTile(
              leading: const Icon(Icons.category),
              title: const Text("Kategori Produk"),
              onTap: () {
                setState(() {
                  _selectedBottom = 2;
                });
                changeBottom(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text("Pilih Tanggal"),
              onTap: () {
                setState(() {
                  _selectedBottom = 3;
                });
                changeBottom(3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text("Atur Pengingat"),
              onTap: () {
                setState(() {
                  _selectedBottom = 4;
                });
                changeBottom(4);
              },
            ),
          ],
        ),
      ),

      body: _widgetOptions.elementAt(_selectedBottom),
    );
  }
}
