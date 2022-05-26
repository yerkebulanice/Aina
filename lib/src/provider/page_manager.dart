import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PageManager {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  static String url = 'assets/audios/1.mp3';
  late AudioPlayer _audioPlayer;
  PageManager() {
    _init();
  }
  void _init() async {
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(url, isLocal: true);
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  void play() {
    _audioPlayer.play(url, isLocal: true);
  }

  void pause() {
    _audioPlayer.pause();
  }
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }
