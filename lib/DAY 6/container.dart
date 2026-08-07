import 'package:flutter/material.dart';

class ContainerDay6 extends StatelessWidget {
  const ContainerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text('Belajar Container Day 6'),
      ),
     
      
      body: Column(
        children: [ Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
          height: 100, 
          width: 200,
           color: Colors.red,
           child: Text("Percobaan Container"),
           ),
        ),
        //3
        Container(margin: EdgeInsets.only(top: 20), padding: EdgeInsets.all(16),height: 100,width: 200,
          decoration: BoxDecoration(
             color: Colors.teal,
           // backgroundBlendMode: BlendMode.color,
          ),
          child: Column(
            children: [
              Text("Nama : Idris"),
              Text("Hoby : Lari"),
              Text("Alamat : Jakarta"),

              Container(
                margin: EdgeInsets.all(8),
                height: 100, width: 200,
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                child: Column(children: [
                  Text('Nama Saya Idris'),
                  Text('Hoby saya Ngoding'),
                  Text('Saya Tinggal Di Indonesia'),
                ],
                ),
              )
            ],
          ),
        )

      ],),
    );
  }
}