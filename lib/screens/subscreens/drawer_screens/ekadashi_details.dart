import 'package:flutter/material.dart';

import 'package:pare/widgets/appbar.dart';

import 'package:get/get.dart';

class EkadashiDetailPage extends StatefulWidget {
  const EkadashiDetailPage({super.key});

  @override
  State<EkadashiDetailPage> createState() => _EkadashiDetailPageState();
}

class _EkadashiDetailPageState extends State<EkadashiDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context: context, title: 'Ekadashi'.tr),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      // height: 130,
                      padding: EdgeInsets.all(10),

                      decoration: BoxDecoration(
                          // color: Colors.orange.shade100,
                          // border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Shattila Ekadashi",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "11-JAN-2023  •  Friday",
                                  style: TextStyle(
                                      fontSize: 18,
                                      // color: Colors.orange.shade700,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Text(
                              "Shattila Ekadashi 2023 सनातन धर्म में षटतिला एकादशी का महत्व बहुत अधिक है। इस दिन भगवान विष्णु का विशेष महत्व है। मान्यता है कि एकादशी तिथि के दिन पूजा-पाठ करने से भक्तों को विशेष लाभ मिलता है और उन्हें सभी प्रकार के कष्टों से मुक्ति मिलती है।",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15,
                                  // color: Colors.orange.shade700,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          // Divider()
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          // CustomScrollView(
          //     physics: BouncingScrollPhysics(),
          //     slivers: <Widget>[
          //       SliverAppBar(
          //           elevation: 0,
          //           backgroundColor: Colors.white,
          //           stretch: true,
          //           forceElevated: true,
          //           automaticallyImplyLeading: false,
          //           // actions: [
          //           //   Container(
          //           //     height: 200,
          //           //   )
          //           // ],\
          //           excludeHeaderSemantics: true,
          //           expandedHeight: 200,
          //           flexibleSpace: FlexibleSpaceBar(
          //             collapseMode: CollapseMode.parallax,
          //             stretchModes: [StretchMode.blurBackground],
          //             background: Center(
          //               child: Container(
          //                 width: double.infinity,
          //                 height: 130,
          //                 padding: EdgeInsets.all(10),
          //                 margin: EdgeInsets.all(20),
          //                 decoration: BoxDecoration(
          //                     color: Colors.orange.shade100,
          //                     borderRadius: BorderRadius.circular(15)),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.stretch,
          //                   children: [
          //                     Text(
          //                       "Shattila Ekadashi",
          //                       style: TextStyle(
          //                           fontSize: 20,
          //                           color: Colors.orange.shade700,
          //                           fontWeight: FontWeight.bold),
          //                     ),
          //                     Padding(
          //                       padding:
          //                           const EdgeInsets.symmetric(vertical: 8.0),
          //                       child: Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Text(
          //                             "11-JAN-2023  •  Friday",
          //                             style: TextStyle(
          //                                 fontSize: 18,
          //                                 color: Colors.orange.shade700,
          //                                 fontWeight: FontWeight.w500),
          //                           ),
          //                         ],
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           )),
          //       SliverList(
          //           delegate: SliverChildListDelegate([
          //         Container(
          //           // height: double.infinity,
          //           width: double.infinity,
          //           margin: EdgeInsets.symmetric(horizontal: 5),
          //           decoration: BoxDecoration(
          //               color: Colors.orange.shade100,
          //               borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(15),
          //                   topRight: Radius.circular(15))),
          //           child: Column(
          //             children: [
          //               Container(
          //                 margin: EdgeInsets.only(top: 10),
          //                 height: 5,
          //                 width: 100,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(100),
          //                     color: Colors.orange),
          //               ),
          //               ListView.builder(
          //                 physics: NeverScrollableScrollPhysics(),
          //                 itemCount: 10,
          //                 shrinkWrap: true,
          //                 itemBuilder: (BuildContext context, int index) {
          //                   return Container(
          //                     margin: EdgeInsets.all(20),
          //                     height: 130,
          //                     decoration: BoxDecoration(
          //                       color: Colors.orange.shade50,
          //                       borderRadius: BorderRadius.circular(15),
          //                     ),
          //                     child: Text(
          //                       "data",
          //                       style: TextStyle(color: Colors.black),
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ],
          //           ),
          //         )
          //       ]))
          //     ]

          //     //  Column(
          //     //   children: [
          //     //     Flexible(flex: 2, child: Container()),
          //     //     Flexible(
          //     //         flex: 5,
          //     //         child: Container(
          //     //           height: double.infinity,
          //     //           width: double.infinity,
          //     //           margin: EdgeInsets.symmetric(horizontal: 5),
          //     //           decoration: BoxDecoration(
          //     //               color: Colors.orange.shade100,
          //     //               borderRadius: BorderRadius.only(
          //     //                   topLeft: Radius.circular(15),
          //     //                   topRight: Radius.circular(15))),
          //     //           child: Column(
          //     //             children: [
          //     //               Container(
          //     //                 margin: EdgeInsets.only(top: 10),
          //     //                 height: 5,
          //     //                 width: 100,
          //     //                 decoration: BoxDecoration(
          //     //                     borderRadius: BorderRadius.circular(100),
          //     //                     color: Colors.orange),
          //     //               ),
          //     //             ],
          //     //           ),
          //     //         ))
          //     //   ],
          //     // ),
          //     ),
        ));
  }
}
