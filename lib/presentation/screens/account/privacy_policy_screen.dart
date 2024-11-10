import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent.shade100, Colors.deepPurple.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent.shade100, Colors.deepPurple.shade100],
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
                  "Privacy Policy",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  "Kami menghormati privasi Anda dan berkomitmen untuk melindungi informasi pribadi Anda...",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "Pengumpulan Informasi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Kami mengumpulkan informasi yang Anda berikan secara sukarela, seperti nama, email...",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "Pengumpulan Data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Kami mengumpulkan informasi yang Anda berikan secara sukarela, seperti nama, email...",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "Privasi Data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Kami mengumpulkan informasi yang Anda berikan secara sukarela, seperti nama, email...",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 18),
                Text(
                  "Aksebilitas Data",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Kami mengumpulkan informasi yang Anda berikan secara sukarela, seperti nama, email...",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 18),
                Text(
                  "Efektivitas Policy",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Kami mengumpulkan informasi yang Anda berikan secara sukarela, seperti nama, email...",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 18),
                Text(
                  "Privasi Akses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Kami mengumpulkan informasi yang Anda berikan secara sukarela, seperti nama, email...",
                  style: TextStyle(fontSize: 16),
                ),
                // Tambahkan teks lain sesuai dengan kebijakan privasi yang diinginkan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
