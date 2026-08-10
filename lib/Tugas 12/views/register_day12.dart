import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas%2012/views/user_list.dart';


import '../database/database_helper.dart';
import '../models/user_model.dart';

class RegisterDay12 extends StatefulWidget {
  final UserModel? user;

  const RegisterDay12({super.key, this.user});

  @override
  State<RegisterDay12> createState() => _RegisterDay12State();
}

class _RegisterDay12State extends State<RegisterDay12> {
  final _formKey = GlobalKey<FormState>();

  final namaC = TextEditingController();
  final emailC = TextEditingController();
  final hpC = TextEditingController();
  final passwordC = TextEditingController();
  final kotaC = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    if (widget.user != null) {
      namaC.text = widget.user!.nama;
      emailC.text = widget.user!.email;
      hpC.text = widget.user!.noHp;
      passwordC.text = widget.user!.password;
      kotaC.text = widget.user!.kota;
    }
  }

  @override
  void dispose() {
    namaC.dispose();
    emailC.dispose();
    hpC.dispose();
    passwordC.dispose();
    kotaC.dispose();

    super.dispose();
  }

  Future simpanData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    final user = UserModel(
      id: widget.user?.id,
      nama: namaC.text.trim(),
      email: emailC.text.trim(),
      noHp: hpC.text.trim(),
      password: passwordC.text,
      kota: kotaC.text.trim(),
    );

    if (widget.user == null) {
      await DatabaseHelper.instance.insertUser(user);
    } else {
      await DatabaseHelper.instance.updateUser(user);
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Berhasil!'),
        content: Text(
          widget.user == null
              ? 'Data peserta berhasil ditambahkan.'
              : 'Data peserta berhasil diupdate.',
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, true);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String? validasiNama(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama wajib diisi';
    }
    return null;
  }

  String? validasiEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    }
    if (!value.contains('@')) {
      return 'Format email tidak valid';
    }
    return null;
  }

  String? validasiHp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor HP wajib diisi';
    }
    if (value.length < 10) {
      return 'Nomor HP minimal 10 digit';
    }
    return null;
  }

  String? validasiPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  String? validasiKota(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Asal kota wajib diisi';
    }
    return null;
  }

  InputDecoration inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.8),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/Latar Belakang.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/Logo.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: namaC,
                        validator: validasiNama,
                        decoration: inputDecoration(
                          'Nama Lengkap',
                          Icons.person,
                        ),
                      ),
                      const SizedBox(height: 15),

                      TextFormField(
                        controller: emailC,
                        keyboardType: TextInputType.emailAddress,
                        validator: validasiEmail,
                        decoration: inputDecoration('Email', Icons.email),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: hpC,
                        keyboardType: TextInputType.phone,
                        validator: validasiHp,
                        decoration: inputDecoration('Nomor HP', Icons.phone),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: passwordC,
                        obscureText: true,
                        validator: validasiPassword,
                        decoration: inputDecoration('Password', Icons.lock),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: kotaC,
                        validator: validasiKota,
                        decoration: inputDecoration(
                          'Asal Kota',
                          Icons.location_city,
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : simpanData,
                          child: isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  widget.user == null
                                      ? 'SIMPAN DATA'
                                      : 'UPDATE DATA',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserListDay12(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.list),
                          label: const Text('LIHAT DATA'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
