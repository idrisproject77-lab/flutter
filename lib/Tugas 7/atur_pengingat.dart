import 'package:flutter/material.dart';

class AturPengingat extends StatefulWidget {
  const AturPengingat({super.key});

  @override
  State<AturPengingat> createState() => _AturPengingatState();
}

class _AturPengingatState extends State<AturPengingat> {
  TimeOfDay? waktu;

  Future<void> pilihWaktu() async {
    final TimeOfDay? hasil = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (hasil != null) {
      setState(() {
        waktu = hasil;
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
            "Atur Pengingat",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          ElevatedButton.icon(
            onPressed: pilihWaktu,
            icon: const Icon(Icons.access_time),
            label: const Text("Pilih Waktu"),
          ),

          const SizedBox(height: 30),

          Text(
            waktu == null
                ? "Belum memilih waktu"
                : "Pengingat disetel pukul ${waktu!.format(context)}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          if (waktu != null)
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(
                  Icons.alarm,
                  color: Colors.blue,
                ),
                title: const Text("Waktu Pengingat"),
                subtitle: Text(waktu!.format(context)),
              ),
            ),
        ],
      ),
    );
  }
}