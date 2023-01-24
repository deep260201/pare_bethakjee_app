import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pare/constent/constent.dart';
import 'package:pare/language/languages.dart';

import 'package:pare/screens/subscreens/shplash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: Languages(),
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        title: 'Pare',
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: SplashScreen());
  }
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void showBox({String? messege, Color? color}) {
  if (scaffoldMessengerKey.currentState != null) {
    try {
      scaffoldMessengerKey.currentState!
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.floating,
            backgroundColor: color,
            elevation: 15,
            content: Text(
              messege!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )));
    } catch (e) {
      print(e);
    }
    //   }
    // }
  }
}
