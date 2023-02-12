import 'package:flutter/material.dart';
import 'package:pare/screens/subscreens/bhajan/bhajan_data.dart';
import 'package:pare/screens/subscreens/bhajan/bhajan_player_pahe.dart';
import 'package:pare/screens/subscreens/vachnamrut/Data.dart';
import 'package:pare/screens/subscreens/vachnamrut/vachnamrut_vide_player.dart';
import 'package:pare/widgets/appbar.dart';
import 'package:get/get.dart';

class BajanList extends StatefulWidget {
  const BajanList({super.key});

  @override
  State<BajanList> createState() => _BajanListState();
}

class _BajanListState extends State<BajanList> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  bool isAodio = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'Bhajan'.tr),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, top: 20, right: 40, bottom: 10),
              child: Container(
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAodio = true;
                          _controller.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      child: AnimatedDefaultTextStyle(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 300),
                        child: Text("Audio"),
                        // "Popular",
                        style: TextStyle(
                            fontWeight: isAodio ? FontWeight.bold : null,
                            fontSize: isAodio ? 20 : 14,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAodio = false;
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      child: AnimatedDefaultTextStyle(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 300),
                        child: Text("Video"),
                        // "Popular",
                        style: TextStyle(
                            fontWeight: !isAodio ? FontWeight.bold : null,
                            fontSize: !isAodio ? 20 : 14,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  print(value);

                  if (value == 0) {
                    setState(() {
                      isAodio = true;
                    });
                  } else {
                    setState(() {
                      isAodio = false;
                    });
                  }
                },
                children: [
                  // audio
                  ListView.builder(
                    itemCount: playlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => bhajanPlayer(
                                        index: index,
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 8, left: 25, right: 25),
                          child: ListTile(
                            selectedColor: Colors.red,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                playlist[index].imageUrl,
                                width: 45,
                              ),
                            ),
                            title: Text(
                              playlist[index].title,
                              style: TextStyle(),
                            ),
                            subtitle: Text(
                              playlist[index].artistName,
                              style: TextStyle(),
                            ),
                            trailing: Icon(
                              Icons.play_circle,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // video
                  ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: vachnamrut.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        title: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 200,
                            child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loader.gif',
                                placeholderScale: 15,
                                placeholderFit: BoxFit.scaleDown,
                                fit: BoxFit.fill,
                                imageErrorBuilder:
                                    (context, error, stackTrace) => SizedBox(
                                        height: 200,
                                        child: Icon(
                                          Icons.image_not_supported_outlined,
                                          size: 40,
                                        )),
                                image: vachnamrut[index].coverUrl!),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 10),
                          child: Text(
                            '${vachnamrut[index].title!}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VachnarmutVideoPlayer(
                                    videoUrl: vachnamrut[index].videoURL!),
                              ));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
