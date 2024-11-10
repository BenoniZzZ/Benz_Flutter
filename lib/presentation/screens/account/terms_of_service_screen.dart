import 'package:flutter/material.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent.shade200, Colors.deepPurple.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,  // Memastikan konten memenuhi tinggi layar penuh
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent.shade200, Colors.deepPurple.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Service",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 3, 3, 3)),
                ),
                SizedBox(height: 16),
                Text(
                  "Dengan mengakses atau menggunakan aplikasi kami, Anda setuju untuk terikat dengan ketentuan berikut...",
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 16),
                Text(
                  "Penggunaan Aplikasi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 3, 3, 3)),
                ),
                SizedBox(height: 8),
                Text(
                  "Anda harus menggunakan aplikasi ini sesuai dengan ketentuan yang berlaku...",
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 4, 4, 4)),
                ),
                // Tambahkan lebih banyak teks sesuai dengan ketentuan layanan yang diinginkan
                SizedBox(height: 16), // Tambahan jarak untuk menghindari area kosong
              ],
            ),
          ),
        ),
      ),
    );
  }
}
