import 'package:flutter/material.dart';

class SinglechillscrollviewDay8 extends StatelessWidget {
  const SinglechillscrollviewDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Halaman'), backgroundColor: Colors.amber),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        physics: BouncingScrollPhysics(),

        //reverse: true,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(color: Colors.red, height: 400, width: 400),
                  Container(color: Colors.blueAccent, height: 300, width: 300),
                  Container(color: Colors.lightGreen, height: 200, width: 200),
                  Container(color: Colors.blueGrey, height: 100, width: 100),
                  Container(
                    color: Colors.deepPurpleAccent,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            ),
            Container(color: Colors.red, height: 400, width: 400),
            Container(color: Colors.blueAccent, height: 300, width: 300),
            Container(color: Colors.lightGreen, height: 200, width: 200),
            Container(color: Colors.blueGrey, height: 100, width: 100),
            Container(color: Colors.deepOrangeAccent, height: 50, width: 50),
          ],
        ),
      ),
    );
  }
}
