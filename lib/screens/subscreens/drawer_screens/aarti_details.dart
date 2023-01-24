import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'package:get/get.dart';
import 'package:pare/widgets/appbar.dart';

class ArtiDetail extends StatefulWidget {
  const ArtiDetail({super.key});

  @override
  State<ArtiDetail> createState() => AartiStateDetail();
}

class AartiStateDetail extends State<ArtiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'Aarti Time'.tr),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // LOGO
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                          width: double.infinity,
                          // padding: EdgeInsets.symmetric(vertical: 25),
                          child: Image.asset('assets/images/arti_time.jpg')),
                    ),
                  ),
                ),

                // Address
                TimeCard(
                  darshan: "${"Managala".tr} ${"arti".tr}",
                  time: "8:30 AM",
                ),

                // TimeCard(
                //   darshan: "Shringar".tr,
                //   time: "10:15 AM - 10:45 AM",
                // ),
                TimeCard(
                  darshan: "${"Rajbhog".tr} ${"arti".tr}",
                  time: "11:45 PM",
                ),
                // TimeCard(
                //   darshan: "Uthapan".tr,
                //   time: "5:00 PM - 5:15 PM",
                // ),
                // TimeCard(
                //   darshan: "Sandhya".tr,
                //   time: "5:30 PM - 6:00 PM",
                // ),
                TimeCard(
                  darshan: "${"Shayan".tr} ${"arti".tr}",
                  time: "7:00 PM",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  final String darshan;
  final String time;
  const TimeCard({
    Key? key,
    required this.darshan,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 10,
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.orange.shade50,
            ),
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  darshan,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    time,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
