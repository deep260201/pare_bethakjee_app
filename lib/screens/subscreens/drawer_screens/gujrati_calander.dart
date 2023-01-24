import 'package:flutter/material.dart';
import 'package:pare/constent/constent.dart';
import 'package:pare/language/languages.dart';
import 'package:pare/widgets/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:get/get.dart';

class GujaratiCalendar extends StatefulWidget {
  GujaratiCalendar({Key? key}) : super(key: key);

  @override
  State<GujaratiCalendar> createState() => _GujaratiCalendarState();
}

class _GujaratiCalendarState extends State<GujaratiCalendar> {
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
        // onNavigationRequest: (NavigationRequest request) {
        //   if (request.url.startsWith('https://www.youtube.com/')) {
        //     return NavigationDecision.prevent;
        //   }
        //   return NavigationDecision.navigate;
        // },
      ),
    )
    ..loadRequest(currontLaguage == Languages.eng
        ? Uri.parse(
            'https://www.drikpanchang.com/gujarati/panchang/gujarati-month-panchang.html?lang=en')
        : Uri.parse(
            'https://www.drikpanchang.com/gujarati/panchang/gujarati-month-panchang.html?lang=gu'));
  // String url =
  //     'https://www.drikpanchang.com/muhurat/choghadiya.html?geoname-id=1255364';

  @override
  void initState() {
    controller.scrollTo(0, 2020);
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
      appBar: myAppBar(context: context, title: 'Gujarati Calendar'.tr),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
