import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bato_mechanic/src/common/widgets/audio_widget.dart';
import 'package:bato_mechanic/src/common/widgets/butons/submit_button.dart';
import 'package:bato_mechanic/src/utils/data_types/string_or_audio.dart';
import 'package:bato_mechanic/src/utils/extensions/double_extensions.dart';
import 'package:bato_mechanic/src/utils/extensions/string_extension.dart';
import 'package:bato_mechanic/src/features/repair_request/application/repair_request_service.dart';
import 'package:bato_mechanic/src/features/repair_request/domain/vehicle_repair_request.dart';
import 'package:bato_mechanic/src/utils/constants/managers/values_manager.dart';
import 'package:bato_mechanic/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RepairProgressScreen extends ConsumerWidget {
  final List<RepairStep> repairSteps;

  RepairProgressScreen({required this.repairSteps});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRepariRequest =
        ref.watch(watchRepairRequestStateChangesProvider).value;
    ref.read(repairRequestServiceProvider).fetchUserRepairRequests('1');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Progress'),
      ),
      body: ListView.builder(
        itemCount: repairSteps.length,
        itemBuilder: (context, index) {
          final step = repairSteps[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text('Step ${index + 1}'),
              subtitle: Text('Status: ${step.status}'),
              trailing: IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.r16),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(16.0.doubleHardcoded()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              step.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            if (step.detail.runtimeType == StringData)
                              Text(
                                'Details: ${(step.detail as StringData).stringValue}',
                                style: const TextStyle(fontSize: 16),
                              )
                            else
                              AudioPlayerWidget(
                                  audioPath: (step.detail as AudioData)
                                      .audioFile
                                      .path),
                            const SizedBox(height: 16),
                            Text('Status: ${step.status}',
                                style: const TextStyle(fontSize: 16)),
                            if (step.report != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Report Fields:',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  for (var field in step.report!.reportFields)
                                    Text('${field['name']}: ${field['value']}',
                                        style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: activeRepariRequest?.status ==
                  VehicleRepairRequestStatus.WAITING_COMPLETION_ACCEPTANCE
              ? ElevatedButton(
                  child: Text('Complete the process'.hardcoded()),
                  onPressed: () =>
                      context.goNamed(appRoute.ReviewMechanic.name),
                )
              : null,
        ),
      ),
    );
  }
}

class RepairStep {
  final String name;
  // final String detail;
  final StringOrAudio detail;
  final String status;
  final RepairStepReport? report;

  RepairStep({
    required this.name,
    required this.detail,
    required this.status,
    this.report,
  });
}

class RepairStepReport {
  final List<Map<String, dynamic>> reportFields;

  RepairStepReport({required this.reportFields});
}





//   Widget _buildAudioDetails(AudioData audioData) {
//     final player = AudioPlayer();
//     player.onPlayerComplete.listen((event) {
//       // Handle audio playback completion here, if needed.
//     });

//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children:
//           [
//             Text('Step 1 Audio Details',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 16),
//             Text('Audio File: ${audioData.audioFile.path}',
//               style: TextStyle(fontSize: 16)),
//             SizedBox(height: 16),
//             StreamBuilder<Duration?>(
//               stream: player.onPositionChanged,
//               builder: (context, snapshot) {
//                 final durationFuture = player.getDuration();

//                 if (snapshot.hasData && durationFuture != null) {
//                   final position = snapshot.data!;
//                   final duration = durationFuture;

//                   return Column(
//                     children:
//                       [
//                         Slider(
//                           value: position.inSeconds.toDouble(),
//                           onChanged: (value) {
//                             player.seek(Duration(seconds: value.toInt()));
//                           },
//                           min: 0,
//                           max: duration.inSeconds.toDouble(),
//                           // max: duration. .toDouble(),
//                         ),
//                         Text(
//                           '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
                    
//                   );
//                 } else {
//                   return CircularProgressIndicator(); // Show a loading indicator while fetching duration.
//                 }
//               },
//             ),
//             IconButton(
//               onPressed: () async {
//                 if (player.state == PlayerState.PAUSED) {
//                   await player.resume();
//                 } else {
//                   String audioPath = audioData.audioFile.path;
//                   await player.play(audioPath, isLocal: true);
//                 }
//               },
//               icon: StreamBuilder<PlayerState>(
//                 stream: player.onPlayerStateChanged,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     final playerState = snapshot.data;
//                     if (playerState == PlayerState.PLAYING) {
//                       return Icon(Icons.pause);
//                     } else {
//                       return Icon(Icons.play_arrow);
//                     }
//                   } else {
//                     return Icon(Icons.play_arrow);
//                   },
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }