import 'package:bato_mechanic/src/managers/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioPath;

  const AudioPlayerWidget({super.key, required this.audioPath});

  @override
  AudioPlayerWidgetState createState() => AudioPlayerWidgetState();
}

class AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final player = AudioPlayer();
  double sliderValue = 0;
  Duration audioDuration = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.onPlayerComplete.listen((event) {
      // Handle audio playback completion here.
      player.stop();
      setState(() {
        sliderValue = 0;
      });
    });

    player.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration;
      });
    });

    player.onPositionChanged.listen((Duration position) {
      setState(() {
        sliderValue = position.inSeconds.toDouble();
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            if (player.state == PlayerState.playing) {
              await player.pause();
            } else {
              await player.play(AssetSource(widget.audioPath));
            }
          },
          icon: Icon(
            player.state == PlayerState.playing
                ? Icons.pause
                : Icons.play_arrow,
            size: AppSize.s28,
          ),
        ),
        Slider(
          min: 0,
          max: audioDuration.inSeconds.toDouble(),
          value: sliderValue,
          onChanged: (newValue) {
            setState(() {
              sliderValue = newValue;
            });
            player.seek(Duration(seconds: newValue.toInt()));
          },
        ),
      ],
    );
  }
}
