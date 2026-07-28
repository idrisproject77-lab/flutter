import 'package:flutter/material.dart';

class InteraksiFlutter extends StatefulWidget {
  const InteraksiFlutter({super.key});

  @override
  State<InteraksiFlutter> createState() => _InteraksiFlutterState();
}

class _InteraksiFlutterState extends State<InteraksiFlutter> {
  bool showSecret = false;
  bool isFavorite = false;
  bool showDescription = false;
  String inkwellText = "";
  int angka = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 5,
        title: const Text(
          "Lab Interaksi Flutter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("ini tentang ElevatedButton:"),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showSecret = !showSecret;
                  });
                },
                child: Text(showSecret ? "Sembunyikan" : "Click Here!"),
              ),

              const SizedBox(height: 20),

              if (showSecret)
                const Text(
                  "Cilup BAK!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

              const SizedBox(height: 30),

              const Text("Ini tentang IconButton:"),

              const SizedBox(height: 10),

              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey,
                  size: 50,
                ),
              ),

              Text(
                isFavorite ? "Disukai!" : "Belum Disukai",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                "Ini tentang TextButton:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  setState(() {
                    showDescription = !showDescription;
                  });
                },
                child: Text(
                  showDescription ? "Sembunyikan Deskripsi" : "Lihat Deskripsi",
                ),
              ),

              if (showDescription)
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Flutter adalah framework dari Google yang digunakan untuk membuat aplikasi Android, iOS, Web, dan Desktop menggunakan satu bahasa pemrograman yaitu Dart.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              const SizedBox(height: 30),

              const Text(
                "Ini tentang InkWell:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  setState(() {
                    inkwellText = "Sentuhan terdeteksi!";
                  });

                  print("Sentuhan terdeteksi");
                },

                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Sentuh Kotak Ini",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                inkwellText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              const Text("Ini tentang GestureDetector:"),

              const SizedBox(height: 15),

              GestureDetector(
                onTap: () {
                  setState(() {
                    angka++;
                  });
                  print("Ditekan sekali");
                },

                onDoubleTap: () {
                  setState(() {
                    angka += 2;
                  });
                  print("Ditekan dua kali");
                },

                onLongPress: () {
                  setState(() {
                    angka += 3;
                  });
                  print("Tahan lama");
                },

                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Center(
                    child: Text(
                      "Angka: $angka",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "• Tap = +1\n• Double Tap = +2\n• Long Press = +3",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            angka--;
          });
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
