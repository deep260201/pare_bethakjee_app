import 'package:flutter/material.dart';

AppBar myAppBar(
    {required BuildContext context,
    required String title,
    List<Widget> action = const []}) {
  return AppBar(
    backgroundColor: Colors.orange.shade50,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(title),
    actions: action,
  );
}
