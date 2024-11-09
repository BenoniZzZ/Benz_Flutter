import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;

  const AudioPlayerWidget({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    widget.audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        _duration = newDuration;
      });
    });

    widget.audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        _currentPosition = newPosition;
      });
    });
  }

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await widget.audioPlayer.pause();
    } else {
      await widget.audioPlayer.resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: 0,
          max: _duration.inSeconds.toDouble(),
          value: _currentPosition.inSeconds.toDouble(),
          onChanged: (value) async {
            final position = Duration(seconds: value.toInt());
            await widget.audioPlayer.seek(position);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(_currentPosition),
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause_circle : Icons.play_circle,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: _togglePlayPause,
              ),
              Text(
                _formatDuration(_duration),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
