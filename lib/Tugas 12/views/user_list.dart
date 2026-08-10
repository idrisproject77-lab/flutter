import 'package:flutter/material.dart';
// Sesuaikan dengan path database helper dan model Day 18 kamu
import 'package:flutter_application_1/Day%2018/dataBase/db_helper.dart';
import 'package:flutter_application_1/Day%2018/models/user_login_model.dart';

class UserListDay12 extends StatefulWidget {
  const UserListDay12({super.key});

  @override
  State<UserListDay12> createState() => _UserListDay12State();
}

class _UserListDay12State extends State<UserListDay12> {
  // Ubah tipe model menyesuaikan Day 18 (UserModelSQL)
  late Future<List<UserModelSQL>> users;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // Fungsi untuk memuat data dari DBHelper Day 18
  void loadData() {
    setState(() {
      users = DBHelper().getAllUsers();
    });
  }

  // 1. FUNGSI HAPUS DATA
  void hapusUser(int id) async {
    await DBHelper().deleteUser(id);
    loadData(); // Refresh tampilan setelah dihapus
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Data berhasil dihapus')));
  }

  // 2. FUNGSI EDIT DATA (Menampilkan Dialog Form Edit)
  void tampilkanFormEdit(UserModelSQL user) {
    final namaC = TextEditingController(text: user.nama);
    final emailC = TextEditingController(text: user.email);
    final hpC = TextEditingController(text: user.noHp);
    final passwordC = TextEditingController(text: user.password);
    final kotaC = TextEditingController(text: user.kota);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Data User'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: namaC,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: emailC,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: hpC,
                  decoration: const InputDecoration(labelText: 'No HP'),
                ),
                TextField(
                  controller: passwordC,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                TextField(
                  controller: kotaC,
                  decoration: const InputDecoration(labelText: 'Kota'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Buat objek user baru dengan ID yang sama untuk di-update
                final userUpdated = UserModelSQL(
                  id: user.id,
                  nama: namaC.text.trim(),
                  email: emailC.text.trim(),
                  noHp: hpC.text.trim(),
                  password: passwordC.text,
                  kota: kotaC.text.trim(),
                );

                await DBHelper().updateUser(userUpdated);
                loadData(); // Refresh data

                if (!mounted) return;
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data berhasil diubah')),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Peserta'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: loadData, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder<List<UserModelSQL>>(
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
                          // TOMBOL EDIT & DELETE DI SINI
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => tampilkanFormEdit(user),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Konfirmasi sebelum menghapus
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Hapus Data'),
                                  content: Text(
                                    'Yakin ingin menghapus ${user.nama}?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Batal'),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        hapusUser(user.id!);
                                      },
                                      child: const Text(
                                        'Hapus',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
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
