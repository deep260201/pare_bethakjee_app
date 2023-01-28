import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pare/constent/constent.dart';
import 'package:pare/main.dart';
import 'package:get/get.dart';
import 'package:pare/screens/subscreens/vachnamrut/vachnamrut_player.dart';
import 'package:pare/widgets/homepage_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Map<String, Widget>> horizontelList = [
  //   {'livedarsh': LiveDarshScreen()},
  //   {'today darshan': TodaysDarshan()}
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
              items: [Image.asset('assets/images/home_c.jpg')],
              options: CarouselOptions(
                autoPlay: false,
                // enlargeCenterPage: true,
                viewportFraction: 0.90,
                // aspectRatio: 2.0,+
                initialPage: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //grod catagory
            GridView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                // itemCount: 4,
                children: [
                  // itemBuilder: (BuildContext context, int index) {
                  gridCard(
                    title: 'e-Dan Peti'.tr,
                    icon: Icons.app_settings_alt,
                    onTap: () {
                      showBox(
                          messege: 'This feature will launch soon'.tr,
                          color: Colors.orange);
                    },
                  ),
                  gridCard(
                    title: 'Prashad'.tr,
                    icon: Icons.hive_sharp,
                    onTap: () {
                      showBox(
                          messege: 'This feature will launch soon'.tr,
                          color: Colors.orange);
                    },
                  ),
                  gridCard(
                    title: 'Events'.tr,
                    icon: Icons.event,
                    onTap: () {
                      showBox(
                          messege: 'This feature will launch soon'.tr,
                          color: Colors.orange);
                    },
                  ),
                  gridCard(
                    title: 'e-Puja'.tr,
                    icon: Icons.adjust_sharp,
                    onTap: () {
                      showBox(
                          messege: 'This feature will launch soon'.tr,
                          color: Colors.orange);
                    },
                  )
                ]
                // },
                ),

            SizedBox(
              height: 20,
            ),

            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                horizontelcard(
                  title: 'Live Darshan'.tr,
                  icon: Icons.live_tv_outlined,
                  onTap: () {
                    currentIndex.value = 0;
                  },
                ),
                horizontelcard(
                  title: 'History'.tr,
                  icon: Icons.menu_book_outlined,
                  onTap: () {},
                ),
                horizontelcard(
                  title: 'Bhajan'.tr,
                  icon: Icons.library_music,
                  onTap: () {},
                ),
                horizontelcard(
                  title: 'Vachnamrut'.tr,
                  icon: Icons.video_collection_rounded,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VachnamrutPage(),
                        ));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
