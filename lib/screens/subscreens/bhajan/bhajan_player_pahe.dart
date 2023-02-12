import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pare/models/audio_duration.dart';
import 'package:pare/screens/subscreens/bhajan/bhajan_data.dart';
import 'package:rxdart/rxdart.dart' as rx;

class bhajanPlayer extends StatefulWidget {
  final int index;
  const bhajanPlayer({super.key, required this.index});

  @override
  State<bhajanPlayer> createState() => _bhajanPlayerState();
}

class _bhajanPlayerState extends State<bhajanPlayer>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  bool isPlaying = false;
  int? songIndex;

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
    songIndex = widget.index;
    setSorce(songIndex!);

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  setSorce(int index) async {
    await _audioPlayer.setUrl(playlist[index].songUrl,
        initialPosition: Duration(seconds: 0, microseconds: 0));
    if (mounted) setState(() {});
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
                  child: Image.network(playlist[songIndex!].imageUrl),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                playlist[songIndex!].title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                playlist[songIndex!].artistName,
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

                if (positionData?.position != null) {
                  if (position.inSeconds == duration.inSeconds) {
                    if (songIndex! < playlist.length - 1) {
                      songIndex = songIndex! + 1;

                      setSorce(songIndex!);
                    }
                  }
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IgnorePointer(
                          ignoring: songIndex! > 0 ? false : true,
                          child: Opacity(
                            opacity: songIndex! > 0 ? 1 : 0.5,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  songIndex = songIndex! - 1;
                                });
                                setSorce(songIndex!);
                              },
                              child: Icon(
                                Icons.skip_previous,
                                color: Color.fromARGB(255, 48, 47, 47),
                                size: 40,
                              ),
                            ),
                          ),
                        ),

                        //backrword
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

                        // puse and play
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

                        //forwod
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

                        // next
                        IgnorePointer(
                          ignoring:
                              songIndex! < playlist.length - 1 ? false : true,
                          child: Opacity(
                            opacity: songIndex! < playlist.length - 1 ? 1 : 0.5,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  songIndex = songIndex! + 1;
                                });
                                setSorce(songIndex!);
                              },
                              child: Icon(
                                Icons.skip_next,
                                color: Color.fromARGB(255, 48, 47, 47),
                                size: 40,
                              ),
                            ),
                          ),
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
