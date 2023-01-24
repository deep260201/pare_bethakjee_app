import 'package:flutter/material.dart';
import 'package:pare/screens/subscreens/drawer_screens/aarti_details.dart';
import 'package:pare/screens/subscreens/drawer_screens/choghadiya.dart';
import 'package:pare/screens/subscreens/drawer_screens/darshan_details_page.dart';
import 'package:pare/screens/subscreens/drawer_screens/ekadashi_details.dart';
import 'package:pare/screens/subscreens/drawer_screens/gujrati_calander.dart';
import 'package:pare/screens/subscreens/drawer_screens/today_darshan.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              Text(
                "Jay Shree Krishna".tr,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              //today dharshn
              drawerTile(
                  title: 'Today Darshan'.tr,
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodaysDarshan(),
                        ));
                  }),

              //today choghadiya
              drawerTile(
                  title: 'Today Choghadiya'.tr,
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodayChoghadiya(),
                        ));
                  }),

              //Gujrati calander
              drawerTile(
                  title: 'Gujarati Calendar'.tr,
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GujaratiCalendar(),
                        ));
                  }),

              //darshn timer
              drawerTile(
                  title: 'Darshan Time'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DarshanDetails(),
                        ));
                    Scaffold.of(context).closeDrawer();
                  }),

              //sarti time
              drawerTile(
                  title: 'Aarti Time'.tr,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArtiDetail(),
                        ));
                    Scaffold.of(context).closeDrawer();
                  }),

              //ekadashi date
              drawerTile(
                  title: 'Ekadashi'.tr,
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EkadashiDetailPage(),
                        ));
                  }),

              //bhog details
              drawerTile(
                  title: 'Bhog Details'.tr,
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                  }),

              // manorath details
              drawerTile(
                  title: 'Manorath Details'.tr,
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                  }),

              //hindola detils
              drawerTile(
                  title: 'Hindola Details'.tr,
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerTile({required String title, VoidCallback? onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: onTap,
    );
  }
}
