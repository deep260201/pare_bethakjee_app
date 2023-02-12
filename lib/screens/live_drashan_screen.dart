import 'package:flutter/material.dart';
import 'package:pare/screens/subscreens/vachnamrut/vachnamrut_vide_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveDarshScreen extends StatefulWidget {
  LiveDarshScreen({Key? key}) : super(key: key);

  @override
  State<LiveDarshScreen> createState() => _LiveDarshScreenState();
}

class _LiveDarshScreenState extends State<LiveDarshScreen> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=_dnjpyavveo");
    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        // autoPlay: true,
        mute: true,
        // isLive: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                YoutubePlayer(
                  actionsPadding: EdgeInsets.all(50),
                  controller: controller!,
                  showVideoProgressIndicator: false,
                  progressIndicatorColor: Colors.orange,
                  bottomActions: [
                    // CurrentPosition(),
                    // ProgressBar(isExpanded: true),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VachnarmutVideoPlayer(
                              videoUrl:
                                  "https://www.youtube.com/watch?v=_dnjpyavveo"),
                        ));
                  },
                  icon: Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
