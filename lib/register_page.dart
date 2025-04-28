import 'package:flutter/material.dart';

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