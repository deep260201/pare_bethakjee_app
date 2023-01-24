import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveDarshScreen extends StatefulWidget {
  LiveDarshScreen({Key? key}) : super(key: key);

  @override
  State<LiveDarshScreen> createState() => _LiveDarshScreenState();
}

class _LiveDarshScreenState extends State<LiveDarshScreen> {
  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: 'BSGKR1IhFoQ',
    flags: YoutubePlayerFlags(
      // autoPlay: true,
      mute: true,
      // isLive: true,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            YoutubePlayer(
              actionsPadding: EdgeInsets.all(50),
              controller: controller,
              showVideoProgressIndicator: false,
              progressIndicatorColor: Colors.orange,
              bottomActions: [
                // CurrentPosition(),
                // ProgressBar(isExpanded: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
