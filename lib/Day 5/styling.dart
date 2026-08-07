import 'package:flutter/material.dart';

class Stylingidris extends StatelessWidget {
  const Stylingidris({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(55, 444, 99, 77),
         title: Text ("Hallo Batch 7"),
         centerTitle: true,
         actions: [Text ('1'), Text ('2')],
         leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
       // mainAxisSize: MainAxisSize.max,
        spacing: 20,
        children: [
        Text (
          "Hello Batch 7",
          style: TextStyle(
            fontSize: 58, //Ukuruan font
            fontWeight: FontWeight.bold,
            color: Colors.amber, // Warna Font
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dotted,
            decorationColor: Colors.blueGrey,
            backgroundColor: Colors.cyanAccent,
            fontStyle: FontStyle.italic,
          ),
        )
      ],)
    );
  }
}




