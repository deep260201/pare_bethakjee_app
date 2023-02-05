import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pare/models/audio_duration.dart';
import 'package:rxdart/rxdart.dart' as rx;

class bhajanPlayer extends StatefulWidget {
  const bhajanPlayer({super.key});

  @override
  State<bhajanPlayer> createState() => _bhajanPlayerState();
}

class _bhajanPlayerState extends State<bhajanPlayer>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  bool isPlaying = false;

  AudioPlayer _audioPlayer = AudioPlayer();

  Stream<PositionData> get _positionDataSteam =>
      rx.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
                position,
                bufferedPosition,
                duration ?? Duration.zero,
              ));

  @override
  void initState() {
    setSorce();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  setSorce() async {
    await _audioPlayer.setAsset('assets/audio/Shri_Yamunashtakm.mp3',
        initialPosition: Duration(seconds: 0, microseconds: 0));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
            child: Container(
          width: double.infinity,
          //color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5000),
                  child: Image.network('https://i.imgur.com/I1i8ZDR.jpg'),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Rocket Queen",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Guns N Roses",
                style: TextStyle(),
              ),
              SizedBox(
                height: 60,
              ),
              StreamBuilder<PositionData>(
                  stream: _positionDataSteam,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    var position = positionData?.position ?? Duration.zero;

                    var duration = positionData?.duration ?? Duration.zero;
                    double count = 0;
                    if (position != Duration.zero) {
                      count = ((position.inSeconds * 100) / duration.inSeconds)
                          .toDouble();
                    }
                    count = count / 100;
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: count,
                            backgroundColor: Color(0xff22242A),
                            color: Colors.orange,
                            semanticsLabel: 'Progress',
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              "${position.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(position.inSeconds.remainder(60).toString().padLeft(2, '0'))}",
                              style: TextStyle(),
                            ),
                            Spacer(),
                            Text(
                              "${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60).toString().padLeft(2, '0'))}",
                              style: TextStyle(),
                            )
                          ],
                        )
                      ],
                    );
                  }),
            ],
          ),
        )),
      ),
      bottomNavigationBar: Container(
        decoration: new BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: StreamBuilder<PositionData>(
              stream: _positionDataSteam,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                var position = positionData?.position ?? Duration.zero;
                var duration = positionData?.duration ?? Duration.zero;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.skip_previous,
                          color: Color.fromARGB(255, 48, 47, 47),
                          size: 40,
                        ),
                        IconButton(
                            onPressed: () {
                              if (position.inSeconds > 10) {
                                _audioPlayer
                                    .seek(position - Duration(seconds: 10));
                              } else {
                                _audioPlayer.seek(Duration.zero);
                              }
                            },
                            icon: Icon(Icons.replay_10_sharp)),
                        InkWell(
                          onTap: () {
                            _handleOnPressed();
                          },
                          child: AnimatedIcon(
                            progress: _animationController!,
                            icon: AnimatedIcons.play_pause,
                            color: Color.fromARGB(255, 48, 47, 47),
                            size: 80,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              if (position.inSeconds < duration.inSeconds) {
                                _audioPlayer
                                    .seek(position + Duration(seconds: 10));
                              } else {
                                _audioPlayer.seek(duration);
                              }
                            },
                            icon: Icon(Icons.forward_10_rounded)),
                        Icon(
                          Icons.skip_next,
                          color: Color.fromARGB(255, 48, 47, 47),
                          size: 40,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  void _handleOnPressed() async {
    setState(() {
      isPlaying = !isPlaying;
    });
    if (isPlaying) {
      _animationController!.forward();
      await _audioPlayer.play();
    } else {
      _animationController!.reverse();
      await _audioPlayer.pause();
    }
  }
}
