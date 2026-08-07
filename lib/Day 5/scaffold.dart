import 'package:flutter/material.dart';

class scaffold_day5 extends StatelessWidget {
  const scaffold_day5({super.key});

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
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
       // mainAxisSize: MainAxisSize.max,
        spacing: 20,
        children: [
        Text ("Hallo Batch 7"),
        Text ("Hallo Batch 7"),
        Text ("Hallo Batch 7"),
      ],)
    );
  }
}