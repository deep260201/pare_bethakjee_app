import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pare/language/languages.dart';
import 'package:pare/screens/layoutpage.dart';
import 'package:pare/screens/subscreens/language_selection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer(
      const Duration(seconds: 5),
      () async {
        await Languages.getLaguage().then((value) {
          if (value != null) {
            Get.updateLocale(value);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LayoutPage(),
              ),
              (route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LanguageSelectionPage(),
              ),
              (route) => false,
            );
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text("Jay Shree Krishna",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
