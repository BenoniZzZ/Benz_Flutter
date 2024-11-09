import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  factory AudioService() {
    return _instance;
  }

  AudioService._internal();

  AudioPlayer get audioPlayer => _audioPlayer;

  bool get isPlaying => _isPlaying;

  Future<void> play(String assetPath) async {
    if (!_isPlaying) {
      await _audioPlayer.setSource(AssetSource(assetPath));
      await _audioPlayer.resume();
      _isPlaying = true;
    } else {
      await _audioPlayer.resume();
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
  }

  Future<void> togglePlayPause(String assetPath) async {
    if (_isPlaying) {
      await pause();
    } else {
      await play(assetPath);
    }
  }
  
  void dispose() {
    _audioPlayer.dispose();
  }
}
