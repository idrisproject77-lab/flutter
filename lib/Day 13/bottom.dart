import 'package:flutter/material.dart';
import 'package:flutter_application_1/Day%2013/drawer.dart';
import 'package:flutter_application_1/Day%2017/Tugas%2011/service/preference_handler.dart';
import 'package:flutter_application_1/Day%208/gridview.dart';
import 'package:flutter_application_1/Day%208/singlechillscrollview.dart';
import 'package:flutter_application_1/Day%208/stack.dart';
import 'package:flutter_application_1/Tugas%204/listview.dart';

class BottomDay13 extends StatefulWidget {
  const BottomDay13({super.key});

  @override
  State<BottomDay13> createState() => _BottomDay13State();
}

class _BottomDay13State extends State<BottomDay13> {
  int _selectedBottom = 0;

  void changeBottom(int index) {
    _selectedBottom = index;
    print("Ini adalah value dari $_selectedBottom");
    setState(() {});
  }

  final List<Widget> _widgetOptions = [
    GridviewDay8(),
    SinglechillscrollviewDay8(),
    StackDay8(),
    ListViewIdris(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ThinkSpend"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await PreferenceHandler.setLogin(false);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DrawerDay13()),
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changeBottom(value);
        },
        currentIndex: _selectedBottom,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "school"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Bussniese",
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedBottom),
    );
  }
}