import 'package:flutter/material.dart';
import 'package:pare/constent/constent.dart';
import 'package:pare/helper/custom_animated_bottom_bar.dart';
import 'package:pare/screens/home_screen.dart';
import 'package:pare/screens/live_drashan_screen.dart';
import 'package:pare/screens/setting_page.dart';
import 'package:pare/widgets/drawer.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade50,
        elevation: 0,
        // automaticallyImplyLeading: false,
        // leading: IconButton(
        //     onPressed: () {
        //       Scaffold.of(context).openDrawer();
        //     },
        //     icon: Icon(Icons.sort)),
        title: Text(contants.pageBethakjee.tr),
        centerTitle: true,
      ),
      drawer: Builder(builder: (context) {
        return Drawer(
          backgroundColor: Colors.orange.shade50,
          child: DrawerWidget(),
        );
      }),
      body: getBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [LiveDarshScreen(), HomeScreen(), SettingPage()];
    return Obx(
      () => IndexedStack(
        index: currentIndex.value,
        children: pages,
      ),
    );
  }

  Widget _buildBottomBar() {
    final _inactiveColor = Colors.grey;
    return Obx(
      () => CustomAnimatedBottomBar(
        containerHeight: 60,
        backgroundColor: Colors.white,
        selectedIndex: currentIndex.value,
        showElevation: true,
        itemCornerRadius: 25,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() => currentIndex.value = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.live_tv_rounded),
            title: Text('Live Darshan'.tr),
            activeColor: Colors.orange,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'.tr),
            activeColor: Colors.orange,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'.tr),
            activeColor: Colors.orange,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
