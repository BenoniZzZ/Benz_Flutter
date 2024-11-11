import 'dart:async';
import 'package:flutter/material.dart';
import '../account/account_screen.dart';
import '../sigInSignUP/login_screen.dart';
import 'audio_player_controls.dart';
import 'audio_service.dart';
import '../account/notification_screen.dart';
import '../account/terms_of_service_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioService _audioService = AudioService();
  bool _isPlaying = false;
  bool _showPlayerControls = false;
  Duration duration = Duration.zero;
  Duration currentPosition = Duration.zero;

  // Variabel untuk pengaturan perubahan gambar di List View
  int _currentImageIndex = 0;
  late Timer _imageChangeTimer;

  // Grid View 
  final List<String> _gridImagePaths = [
    'assets/images/ben1.png',
    'assets/images/ben2.png',
    'assets/images/ben3.png', 
  ];

  //  List View
  final List<String> _imagePaths = [
    'assets/images/ben1.png',
    'assets/images/ben2.png',
    'assets/images/ben3.png', 
  ];

  @override
  void initState() {
    super.initState();
    _setupAudio();
    _checkIfPlaying();
    _startImageChangeTimer(); // Menambahkan timer untuk perubahan gambar
  }

  void _startImageChangeTimer() {
    _imageChangeTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        // Mengubah indeks gambar secara berkala
        _currentImageIndex = (_currentImageIndex + 1) % _imagePaths.length;
      });
    });
  }

  void _checkIfPlaying() {
    setState(() {
      _isPlaying = _audioService.isPlaying;
      _showPlayerControls = _isPlaying;
    });
  }

  void _setupAudio() {
    _audioService.audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    _audioService.audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        currentPosition = newPosition;
      });
    });
  }

  Future<void> _togglePlayPause() async {
    await _audioService.togglePlayPause('songs1.mp3');
    setState(() {
      _isPlaying = _audioService.isPlaying;
      _showPlayerControls = true;
    });
  }

  @override
  void dispose() {
    _audioService.audioPlayer.dispose();
    _imageChangeTimer.cancel(); // Menghentikan timer saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(
                  profileImagePath: 'assets/images/ben2.png',
                  name: 'Benoni Manase Tarigan',
                  university: 'Universitas Proklamasi 45 YK',
                ),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TermsOfServiceScreen(),
                ),
              );
            },
          ),
        ],
        title: const Text(
          'Bang Benz',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Songs Grid View',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('→', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4, // Tetap 4 item
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      margin: const EdgeInsets.only(right: 8),
                      child: Card(
                        color: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                _gridImagePaths[index % _gridImagePaths.length], // Mengulang gambar dengan operator modulus
                                height: 80,
                              ),
                              const SizedBox(height: 8),
                              const Text('BeNZ', style: TextStyle(fontSize: 14, color: Colors.black)),
                              const Text('Song:Sayur Kol', style: TextStyle(fontSize: 12, color: Colors.black54)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Songs List View',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('→', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Image.asset(
                          _imagePaths[_currentImageIndex], // Menggunakan indeks untuk gambar yang berubah
                          height: 60,
                        ),
                        title: const Text('Heart Attack', style: TextStyle(color: Colors.black)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mantan adalah sejarah....',
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: const [
                                Icon(Icons.add, size: 16, color: Colors.black54),
                                SizedBox(width: 8),
                                Text('Today • 23 min', style: TextStyle(fontSize: 10, color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _togglePlayPause();
                            setState(() {
                              _showPlayerControls = true;
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_showPlayerControls)
                AudioPlayerControls(
                  audioPlayer: _audioService.audioPlayer,
                  isPlaying: _isPlaying,
                  duration: duration,
                  currentPosition: currentPosition,
                  togglePlayPause: _togglePlayPause,
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(
                  profileImagePath: 'assets/images/ben2.png',
                  name: 'Benoni Manase Tarigan',
                  university: 'Universitas Proklamasi 45 YK',
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        },
      ),
    );
  }
}
