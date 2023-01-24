import 'package:flutter/material.dart';
import 'package:pare/services/download_image.dart';
import 'package:pare/widgets/appbar.dart';

import 'package:get/get.dart';

class TodaysDarshan extends StatefulWidget {
  TodaysDarshan({Key? key}) : super(key: key);

  @override
  State<TodaysDarshan> createState() => _TodaysDarshanState();
}

class _TodaysDarshanState extends State<TodaysDarshan> {
  List<String> image = [
    'https://cdn.statusqueen.com/mobilewallpaper/thumbnail/Magical_Krishna-156.jpg',
    'https://i.pinimg.com/736x/1d/17/cc/1d17cc5e9ecee1a1882624bea135db11.jpg',
    'https://m.media-amazon.com/images/I/81QJ4TqbusL._SL1500_.jpg',
    'https://images.news18.com/ibnlive/uploads/2022/03/holi-lord-krishna-16473128194x3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'Today Darshan'.tr),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: BouncingScrollPhysics(),
                  itemCount: image.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Image.network(
                                image[index],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              height: 60,
                              width: double.infinity,
                              color: Colors.orange.shade50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "12:25 PM",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        DownloadImage.saveSingleImage(
                                            imageUrl: image[index]);
                                      },
                                      icon: Icon(
                                        Icons.bookmark_outlined,
                                      ),
                                      // padding: EdgeInsets.zero,
                                      color: Colors.black,
                                      iconSize: 30,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          DownloadImage.saveMultyImage(imageUrlList: image);
        },
        icon: Icon(Icons.save),
        label: Text("Save All".tr),
      ),
    );
  }
}
