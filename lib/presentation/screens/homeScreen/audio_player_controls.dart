import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerControls extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final bool isPlaying;
  final Duration duration;
  final Duration currentPosition;
  final VoidCallback togglePlayPause;

  const AudioPlayerControls({
    Key? key,
    required this.audioPlayer,
    required this.isPlaying,
    required this.duration,
    required this.currentPosition,
    required this.togglePlayPause,
  }) : super(key: key);

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.skip_previous, color: Colors.white, size: 24),
              onPressed: () {
                audioPlayer.seek(Duration.zero);
              },
            ),
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                color: Colors.white,
                size: 30,
              ),
              onPressed: togglePlayPause,
            ),
            IconButton(
              icon: const Icon(Icons.skip_next, color: Colors.white, size: 24),
              onPressed: () {
                audioPlayer.seek(duration);
              },
            ),
          ],
        ),
        Slider(
          min: 0.0,
          max: duration.inSeconds.toDouble(),
          value: currentPosition.inSeconds.toDouble().clamp(0.0, duration.inSeconds.toDouble()),
          onChanged: (value) async {
            final newPosition = Duration(seconds: value.toInt());
            await audioPlayer.seek(newPosition);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_formatDuration(currentPosition), style: const TextStyle(color: Colors.white)),
            Text(_formatDuration(duration), style: const TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
