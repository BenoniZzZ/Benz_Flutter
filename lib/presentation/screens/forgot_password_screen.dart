import 'package:flutter/material.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Membungkus konten agar dapat di-scroll
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: Image.asset('assets/responsi.png'), // Logo yang bisa diklik
              ),
              const SizedBox(height: 20),
              const Text(
                'Lupa Password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Masukan email Anda dan tunggu kode etik akan dikirimkan.'),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Masukan Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika pengiriman email
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Ubah warna tombol menjadi biru
                  foregroundColor: Colors.white,

                ),
                child: const Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
