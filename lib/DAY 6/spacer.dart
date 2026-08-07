import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpaaceDay6 extends StatelessWidget {
  const SpaaceDay6({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: Color.fromARGB(255, 100, 111, 170),

  appBar: AppBar(
    shadowColor: Colors.black54,
    toolbarHeight: 45,
    title: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        "Detail Toko",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          fontFamily: "serif",
          color: Colors.white,
        ),
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.indigoAccent,
    elevation: 4,
  ),
      
    body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
         SizedBox(height: 25),
         
        Center(
  child: Text(
  "ALDI'S BURGER",
  style: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    fontFamily: "serif",
    color: Colors.deepPurple,
  ),
),
),
SizedBox(height: 30),

  SizedBox(height: 30),
  Container(
  width: double.infinity,
  
  padding: const EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 9,
  ),

  decoration: BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.circular(20),

    boxShadow: [
      BoxShadow(
        color: Colors.cyan,
        blurRadius:0,
        spreadRadius: 1,
        offset: Offset(0, 3),
      )
    ]
  ),

  child: Row(
    children: [

      Icon(
        Icons.email,
        color: Colors.white,
      ),

      SizedBox(width: 6),

      Text(
        "Aldi's Burger.id",
        style: TextStyle(
          color: Colors.cyanAccent,
          fontWeight: FontWeight.w500,
        ),
      ),

    ],
  ),
),
Padding(
  padding: const EdgeInsets.only(top:20), 
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      // Kiri
      Row(
        children: [
          Icon(Icons.phone),
          SizedBox(width: 8),
          Text("083841111864"),
        ],
      ),

      // Kanan
      Row(
        children: [
          Icon(Icons.location_on),
          SizedBox(width: 8),
          Text("Cempaka Putih"),
        ],
      ),
    ],
  ),
),
SizedBox(height: 25),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    // Kotak Kiri
    Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical:10),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black,
               spreadRadius: 1,
                blurRadius: 1,
                   offset: Offset(0, 3),
            )
          ]
        ),
        child: Column(
          children: [
            Text(
              "300+",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Books Sold",
              style: TextStyle(fontSize: 13,),
            ),
          ],
        ),
      ),
    ),

    SizedBox(width: 20),

    // Kotak Kanan
    Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black,
               spreadRadius: 1,
                blurRadius: 1,
                   offset: Offset(0, 3),
            )
          ]
        ),
        child: Column(
          children: [
            Text(
              "4.8 / 5 ⭐",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Rating User",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    ),

  ],
),

SizedBox(height: 40),


Text(
  "Aldi's Burger adalah restoran yang menyajikan berbagai pilihan burger dengan bahan-bahan segar dan berkualitas. Kami menghadirkan cita rasa khas dengan daging premium, sayuran segar, dan roti lembut yang dipanggang setiap hari. Selain burger, tersedia juga kentang goreng, minuman, dan menu pendamping lainnya yang cocok dinikmati bersama keluarga maupun teman.",
  textAlign: TextAlign.justify,
 style: TextStyle(
  fontSize: 15,
  fontFamily: "serif",
  fontWeight: FontWeight.w400,
  color: Colors.black87,
  height: 1.8,
),
),

SizedBox(height: 25),


Container(
  width: double.infinity,
  height: 150,

  decoration: BoxDecoration(
    color: Colors.indigoAccent,
    borderRadius: BorderRadius.circular(20),
    

    boxShadow: [
      BoxShadow(
          color: Colors.cyanAccent,
        spreadRadius: 1,
        blurRadius: 10,
        offset: Offset(0, 3),
      ),
    ],
  ),
   child: ClipRRect (
    borderRadius: BorderRadiusGeometry.circular(20),
    child: Image.asset(
        "assets/images/burger.jpg",
         fit: BoxFit.contain,
    ),
   )
),

      ],
    ),
  ),
),
    );
  }
}