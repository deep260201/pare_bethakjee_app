import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pare/constent/constent.dart';
import 'package:pare/language/languages.dart';

import 'package:pare/screens/layoutpage.dart';

class LanguageSelectionPage extends StatefulWidget {
  final bool IsFromSetting;
  const LanguageSelectionPage({super.key, this.IsFromSetting = false});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String? selectedLanguage;
  @override
  void initState() {
    if (currontLaguage != '') {
      selectedLanguage = currontLaguage;
    } else {
      selectedLanguage = Languages.eng;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade50,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            contants.selectLanguage.tr,
            style: TextStyle(color: Colors.orange),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedLanguage = Languages.eng;
                  });
                },
                child: Opacity(
                  opacity: selectedLanguage == Languages.eng ? 1 : 0.7,
                  child: Card(
                    elevation: selectedLanguage == Languages.eng ? 10 : 0,
                    shadowColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.orange, width: 3)),
                      child: Text(
                        "English",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedLanguage = Languages.guj;
                  });
                },
                child: Opacity(
                  opacity: selectedLanguage == Languages.guj ? 1 : 0.7,
                  child: Card(
                    elevation: selectedLanguage == Languages.guj ? 7 : 0,
                    shadowColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.orange, width: 3)),
                      child: Text(
                        "ગુજરાતી",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        // height: 50,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.orange.shade200,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 11),
            child: Text(
              "Next".tr,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          onPressed: () {
            Languages.setLaguage(laguageCode: selectedLanguage!);
            currontLaguage = selectedLanguage!;
            if (selectedLanguage == Languages.eng) {
              Get.updateLocale(Locale(Languages.eng));
            } else {
              Get.updateLocale(Locale(Languages.guj));
            }

            if (widget.IsFromSetting) {
              Navigator.pop(context);
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LayoutPage(),
                  ),
                  (route) => false);
            }
          },
        ),
      ),
    );
  }
}
