import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About ThinkSpend"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_balance_wallet,
                size: 80,
                color: Colors.green,
              ),

              const SizedBox(height: 24),

              const Text(
                "ThinkSpend",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              const Text(
                "ThinkSpend adalah aplikasi yang membantu pengguna mengelola keuangan dengan lebih bijak. "
                "Sebelum melakukan pembelian, aplikasi akan mengingatkan pengguna agar berpikir kembali "
                "sehingga dapat mengurangi belanja impulsif dan membantu mencapai tujuan finansial.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              const SizedBox(height: 30),

              const Divider(),

              const SizedBox(height: 20),

              const ListTile(
                leading: Icon(Icons.lightbulb, color: Colors.orange),
                title: Text("Misi"),
                subtitle: Text(
                  "Membantu pengguna mengambil keputusan finansial yang lebih cerdas.",
                ),
              ),

              const Text(
                "ThinkSpend membantu pengguna mengelola keuangan dan mengurangi belanja impulsif agar lebih bijak dalam menggunakan uang.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),

              const SizedBox(height: 20),

              const Text(
                "Developed by Idris",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "ThinkSpend v1.0.0",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
