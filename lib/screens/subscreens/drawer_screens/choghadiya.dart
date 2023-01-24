import 'package:flutter/material.dart';
import 'package:pare/constent/constent.dart';
import 'package:pare/language/languages.dart';
import 'package:pare/widgets/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:get/get.dart';

class TodayChoghadiya extends StatefulWidget {
  TodayChoghadiya({Key? key}) : super(key: key);

  @override
  State<TodayChoghadiya> createState() => Today_ChoghadiyaState();
}

class Today_ChoghadiyaState extends State<TodayChoghadiya> {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
      ),
    )
    ..loadRequest(currontLaguage == Languages.eng
        ? Uri.parse(
            'https://www.drikpanchang.com/muhurat/choghadiya.html?geoname-id=1255364&lang=en')
        : Uri.parse(
            'https://www.drikpanchang.com/muhurat/choghadiya.html?geoname-id=1255364&lang=gu'));

  // String url =
  //     'https://www.drikpanchang.com/muhurat/choghadiya.html?geoname-id=1255364';

  @override
  void initState() {
    controller.scrollTo(0, 1800);
    super.initState();
  }

  @override
  void dispose() {
    controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context, title: 'Today Choghadiya'.tr),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
