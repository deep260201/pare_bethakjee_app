import 'package:flutter/material.dart';

class gridCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  gridCard(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon),
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ]),
      ),
    );
  }
}

//horizontel card

class horizontelcard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const horizontelcard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        elevation: 10,
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.all(15),
          leading: CircleAvatar(radius: 25, child: Icon(icon)),
          title: Center(
              child: Text(
            title,
            style: TextStyle(fontSize: 20),
          )),
          trailing: Icon(
            Icons.arrow_circle_right,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
