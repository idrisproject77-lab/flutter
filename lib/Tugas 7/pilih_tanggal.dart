import 'package:flutter/material.dart';

class PilihTanggal extends StatefulWidget {
  const PilihTanggal({super.key});

  @override
  State<PilihTanggal> createState() => _PilihTanggalState();
}

class _PilihTanggalState extends State<PilihTanggal> {
  DateTime? selectedDate;

  Future<void> pilihTanggal() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pilih Tanggal",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: pilihTanggal,
            child: const Text("Pilih Tanggal"),
          ),

          const SizedBox(height: 30),

          Text(
            selectedDate == null
                ? "Belum memilih tanggal"
                : "Tanggal Lahir : ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
