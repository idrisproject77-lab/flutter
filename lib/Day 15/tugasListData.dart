import 'package:flutter/material.dart';
import 'package:flutter_application_1/Day%2015/tugasList.dart';

class TugaslistdataIdris extends StatelessWidget {
  const TugaslistdataIdris({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peralatan Olahraga'),
        centerTitle: true,
      ) ,
      body: ListView.builder(
        itemCount: namaOlahraga.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(namaOlahraga[index]),
          );
        },),
    );
  }
}