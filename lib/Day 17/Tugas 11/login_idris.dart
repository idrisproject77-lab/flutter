import 'package:flutter/material.dart';
import 'package:flutter_application_1/Day%2013/drawer.dart';
import 'package:flutter_application_1/Day%2017/Tugas%2011/service/preference_handler.dart';
import 'package:flutter_application_1/Day%2018/dataBase/db_helper.dart';
import 'package:flutter_application_1/Day%2018/dataBase/userList.dart';
import 'package:flutter_application_1/Day%2018/models/user_login_model.dart';

// 1. Ubah menjadi StatefulWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 2. Buat TextEditingController untuk mengambil teks dari form
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // 3. Pindahkan variabel state ke DALAM class ini agar lebih aman
  bool _isObscure = true; // Menggantikan 'mata', default true agar tertutup
  bool _isChecked = false; // Untuk checkbox

  // 4. Pastikan membuang controller saat halaman ditutup untuk menghemat memori
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register() async {
    final user = _emailController.text.trim();
    final pass = _passwordController.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = UserModelSQL(email: user, password: pass);

    bool success = await DBHelper().registerUser(pengguna);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
    }
  }

  // 5. Tambahkan Fungsi Login SQFlite sesuai permintaanmu
  void login() async {
    final user = _emailController.text.trim();
    final pass = _passwordController.text;

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = await DBHelper().loginUser(user, pass);

    if (!mounted) return;

    if (pengguna != null) {
      // Simpan status sesi Shared Preferences agar keep login aktif
      await PreferenceHandler.setLogin(true);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DrawerDay13()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal! email atau Password salah.'),
        ),
      );
    }
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
                padding: const EdgeInsets.only(
                  top: 250,
                  bottom: 200,
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 35,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(101, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  // 6. Bungkus dengan Form agar validasi berjalan
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/images/Logo.png", width: 65),
                        const SizedBox(height: 15),
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Enter your email and password to log in",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 35),

                        // FIELD EMAIL (Menggunakan TextFormField)
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email tidak boleh kosong";
                            } else if (!value.contains('@')) {
                              return "Email tidak valid";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "IDRIS@gmail.com",
                            hintStyle: const TextStyle(color: Colors.black87),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // FIELD PASSWORD (Menggunakan TextFormField)
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isObscure,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password tidak boleh kosong";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "********",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    value: _isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        _isChecked = value ?? false;
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(50, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                  color: Color(0xFF4D81E7),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E6FF3),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            // Memanggil fungsi login SQFlite dan validasi form
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E6FF3),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            // Memanggil fungsi login SQFlite dan validasi form
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                register();
                              }
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        Row(
                          children: [
                            Expanded(
                              child: Divider(thickness: 1, color: Colors.white),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Or login with",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(thickness: 1, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            tombolIcon("assets/images/Logo.png"),
                            tombolIcon("assets/images/Facebook.png"),
                            tombolIcon("assets/images/Apple.png"),
                            tombolIcon("assets/images/device.png"),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Lihat data akun?",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Navigasi ke UserListPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UserListPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "User List",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tombolIcon(String namaGambar) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: Image.asset(namaGambar, width: 26, height: 26)),
    );
  }
}
