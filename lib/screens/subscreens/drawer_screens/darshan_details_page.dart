import 'package:flutter/material.dart';
import 'package:pare/widgets/appbar.dart';

import 'package:get/get.dart';

class DarshanDetails extends StatefulWidget {
  const DarshanDetails({super.key});

  @override
  State<DarshanDetails> createState() => _DarshanDetailsState();
}

class _DarshanDetailsState extends State<DarshanDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'Darshan Time'.tr),
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
                          child: Image.asset('assets/images/darshn_time.jpg')),
                    ),
                  ),
                ),

                // Address
                TimeCard(
                  darshan: "Managala".tr,
                  time: "8:00 AM - 9:00 AM",
                ),

                TimeCard(
                  darshan: "Shringar".tr,
                  time: "10:15 AM - 10:45 AM",
                ),
                TimeCard(
                  darshan: "Rajbhog".tr,
                  time: "11:30 AM - 12:00 PM",
                ),
                TimeCard(
                  darshan: "Uthapan".tr,
                  time: "5:00 PM - 5:15 PM",
                ),
                TimeCard(
                  darshan: "Sandhya".tr,
                  time: "5:30 PM - 6:00 PM",
                ),
                TimeCard(
                  darshan: "Shayan".tr,
                  time: "6:45 PM - 7:30 PM",
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
