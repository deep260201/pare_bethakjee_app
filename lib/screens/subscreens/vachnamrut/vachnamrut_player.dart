import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pare/screens/subscreens/vachnamrut/Data.dart';
import 'package:pare/screens/subscreens/vachnamrut/vachnamrut_vide_player.dart';

import 'package:pare/widgets/appbar.dart';
import 'package:get/get.dart';

class VachnamrutPage extends StatefulWidget {
  const VachnamrutPage({super.key});

  @override
  State<VachnamrutPage> createState() => VvachnamrutPageState();
}

class VvachnamrutPageState extends State<VachnamrutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'Vachnamrut'.tr),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: vachnamrut.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              title: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 200,
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loader.gif',
                      placeholderScale: 15,
                      fit: BoxFit.fill,
                      imageErrorBuilder: (context, error, stackTrace) =>
                          SizedBox(
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
      ),
    );
  }
}
