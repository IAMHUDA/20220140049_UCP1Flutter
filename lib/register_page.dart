import 'package:flutter/material.dart';
import 'package:ucp1/home_page.dart';
import 'package:ucp1/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/Consina.png', width: 180, height: 200),

                const Text(
                  "DAFTAR AKUN BARU",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),

                // Nama Lengkap
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text("Nama Lengkap"),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: nameController,
                  decoration: inputDecoration("Nama Lengkap", Icons.person),
                  validator: (value) =>
                      value!.isEmpty ? "Nama lengkap tidak boleh kosong" : null,
                ),
                const SizedBox(height: 24),

                // Email & No HP
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Email"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: emailController,
                            decoration: inputDecoration("Email", Icons.email),
                            validator: (value) =>
                                value!.isEmpty ? "Email tidak boleh kosong" : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("No HP"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: inputDecoration("No HP", Icons.phone),
                            validator: (value) =>
                                value!.isEmpty ? "No HP tidak boleh kosong" : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),


                // Password & Konfirmasi
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Password"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _obscurePassword,
                            decoration: inputDecoration(
                              "Password",
                              Icons.lock,
                            ).copyWith(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(
                                    () => _obscurePassword = !_obscurePassword,
                                  );
                                },
                              ),
                            ),
                            validator: (value) =>
                                value!.isEmpty ? "Password tidak boleh kosong" : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Konfirmasi Password"),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: _obscureConfirm,
                            decoration: inputDecoration(
                              "Konfirmasi",
                              Icons.lock_outline,
                            ).copyWith(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(
                                    () => _obscureConfirm = !_obscureConfirm,
                                  );
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Konfirmasi password tidak boleh kosong";
                              }
                              return null; // Validation handled in button press
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),


                // Button Daftar
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFE5A28),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (passwordController.text != confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Password tidak sama',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: const Color(0xFFFE5A28),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          return;
                        }
                        
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(nama: emailController.text),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),


                // Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah memiliki akun? Silahkan "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        "Login disini!",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),),
        )),
    );
  }
  InputDecoration inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.brown[700]),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red),
      ),
      errorStyle: const TextStyle(color: Colors.red),
    );
  }
}