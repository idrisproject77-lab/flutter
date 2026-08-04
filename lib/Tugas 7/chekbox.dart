import 'package:flutter/material.dart';

class CheckBoxTugas extends StatefulWidget {
  const CheckBoxTugas({super.key});

  @override
  State<CheckBoxTugas> createState() => _CheckBoxTugasState();
}

class _CheckBoxTugasState extends State<CheckBoxTugas> {
  bool isAgree = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Syarat dan\nKetentuan",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Terakhir diperbarui pada 3 Agustus 2026",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Syarat dan Ketentuan ini merupakan perjanjian yang mengikat secara hukum antara Anda, baik secara pribadi maupun atas nama suatu entitas, terkait akses dan penggunaan aplikasi Flutter serta segala bentuk media, saluran media, situs web seluler, atau aplikasi seluler yang terkait.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Anda setuju bahwa dengan mengakses aplikasi ini, Anda telah membaca, memahami, dan menyetujui seluruh syarat dan ketentuan. Jika Anda tidak setuju dengan seluruh syarat dan ketentuan ini, maka Anda wajib menghentikan penggunaan aplikasi.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),

                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      "Saya menyetujui syarat dan ketentuan yang berlaku.",
                    ),
                    value: isAgree,
                    onChanged: (value) {
                      setState(() {
                        isAgree = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),

                  Text(
                    isAgree
                        ? "Pendaftaran diperbolehkan"
                        : "Pendaftaran belum tersedia",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
