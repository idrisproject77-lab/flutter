import 'package:flutter/material.dart';
import 'package:flutter_application_1/Day%2018/database/db_helper.dart'; // Sesuaikan folder db_helper
import 'package:flutter_application_1/Day%2018/models/user_login_model.dart'; // Sesuaikan folder model

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<UserModelSQL> _userList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  // Mengambil data menggunakan fungsi getAllUsers() dari DBHelper kamu
  Future<void> _loadUsers() async {
    // Create DB helper instance and fetch all users
    final db = DBHelper();
    final users = await (db as dynamic).getAllUsers();
    setState(() {
      _userList = users ?? [];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryBgColor = Color(0xFF00224D);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Daftar Akun Terdaftar'),
        backgroundColor: primaryBgColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _userList.isEmpty
          ? const Center(
              child: Text(
                "Belum ada akun yang terdaftar.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _userList.length,
              itemBuilder: (context, index) {
                final user = _userList[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    // Ikon profil ungu di sebelah kiri
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple.shade50,
                      child: const Icon(Icons.person, color: Colors.deepPurple),
                    ),
                    // Menampilkan Email
                    title: Text(
                      user.email ?? '-',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    // Menampilkan Password di bawahnya
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Password: ${user.password ?? '-'}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
