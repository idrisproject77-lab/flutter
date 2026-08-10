import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas%2012/views/register_day12.dart'; // Sesuaikan path file register Anda

import '../database/database_helper.dart';
import '../models/user_model.dart';

class UserListDay12 extends StatefulWidget {
  const UserListDay12({super.key});

  @override
  State<UserListDay12> createState() => _UserListDay12State();
}

class _UserListDay12State extends State<UserListDay12> {
  late Future<List<UserModel>> users;

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  void refreshData() {
    setState(() {
      users = DatabaseHelper.instance.getUsers();
    });
  }

  // Fungsi untuk menghapus data dengan konfirmasi AlertDialog
  void konfirmasiHapus(int id, String nama) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Data'),
        content: Text('Apakah Anda yakin ingin menghapus data $nama?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.pop(context); // Tutup dialog
              await DatabaseHelper.instance.deleteUser(id);
              refreshData(); // Perbarui tampilan list secara instan

              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data berhasil dihapus')),
              );
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Peserta'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: refreshData, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder<List<UserModel>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Terjadi error: ${snapshot.error}'));
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(
              child: Text(
                'Belum ada data peserta',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final user = data[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(child: Icon(Icons.person)),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              user.nama,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // TOMBOL EDIT
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              // Navigasi ke Form Register/Update dengan membawa data user
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterDay12(user: user),
                                ),
                              );

                              // Jika berhasil diupdate, refresh data list
                              if (result == true) {
                                refreshData();
                              }
                            },
                          ),
                          // TOMBOL DELETE
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                konfirmasiHapus(user.id!, user.nama),
                          ),
                        ],
                      ),
                      const Divider(),
                      Text('Email: ${user.email}'),
                      Text('No HP: ${user.noHp}'),
                      Text('Kota: ${user.kota}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
