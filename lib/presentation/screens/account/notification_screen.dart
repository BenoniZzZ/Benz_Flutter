import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
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
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.deepPurple),
              title: const Text("Update aplikasi terbaru tersedia."),
              subtitle: const Text("2 hari yang lalu"),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.deepPurple),
              title: const Text("Fitur baru telah ditambahkan."),
              subtitle: const Text("1 minggu yang lalu"),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.deepPurple),
              title: const Text("Perbaikan bug dan peningkatan keamanan."),
              subtitle: const Text("3 minggu yang lalu"),
            ),
          ],
        ),
      ),
    );
  }
}
