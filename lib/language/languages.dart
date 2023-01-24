import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pare/constent/constent.dart';
import 'package:pare/language/english_json.dart';
import 'package:pare/language/gujrati_json.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Languages extends Translations {
  static String guj = 'gu_IN';
  static String eng = 'en_US';

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': Eng.eng_len,
        'gu_IN': Guj.guj_len,
      };

  static void setLaguage({required String laguageCode}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("laguage", laguageCode);
  }

  static Future<Locale?> getLaguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? laguage = await pref.getString("laguage");

    Locale? local;
    if (laguage != null) {
      currontLaguage = laguage;
      local = Locale(laguage.split('_')[0], laguage.split('_')[1]);
    }

    return local;
  }
}
