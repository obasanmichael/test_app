import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    this.icon,
    this.trailing,
    this.textcolor,
    required this.subtitle,
    required this.title,
    required this.color,
  });

  final Icon? icon;
  final String title;
  final String subtitle;
  final Icon? trailing;
  final Color color;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: textcolor, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: textcolor),
      ),
      trailing: Icon(Icons.arrow_right),
      tileColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
