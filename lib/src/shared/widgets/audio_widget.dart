import 'package:bato_mechanic/src/shared/utils/constants/managers/color_manager.dart';
import 'package:bato_mechanic/src/shared/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/shared/utils/extensions/build_context_extensions.dart';
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
    // player.onPlayerStateChanged.listen((event) {
    //   if (event == PlayerState.paused) {}
    // });
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
            setState(() {});
          },
          style: const ButtonStyle().copyWith(
            backgroundColor: const MaterialStatePropertyAll<Color>(
              ThemeColor.transparent,
            ),
            iconColor: context.isDarkMode
                ? const MaterialStatePropertyAll<Color>(ThemeColor.light)
                : const MaterialStatePropertyAll<Color>(ThemeColor.black),
          ),
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
