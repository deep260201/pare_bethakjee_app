import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VachnarmutVideoPlayer extends StatefulWidget {
  final String videoUrl;
  VachnarmutVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VachnarmutVideoPlayer> createState() => _VachnarmutVideoPlayerState();
}

class _VachnarmutVideoPlayerState extends State<VachnarmutVideoPlayer> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);

    controller = YoutubePlayerController(
      initialVideoId: videoId!,
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: YoutubePlayer(
        actionsPadding: EdgeInsets.all(50),
        controller: controller!,
        showVideoProgressIndicator: false,
        progressIndicatorColor: Colors.red,
        bottomActions: [CurrentPosition(), ProgressBar(isExpanded: true)],
      ),
    );
  }
}
