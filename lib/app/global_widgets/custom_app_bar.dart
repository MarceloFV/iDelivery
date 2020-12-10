import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onBackPressed;

  @override
  final Size preferredSize;
  CustomAppBar({Key key, this.title, this.onBackPressed})
      : preferredSize = Size.fromHeight(50),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      leading: IconButton(
        onPressed: onBackPressed,
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
        iconSize: 12,
      ),
    );
  }

}
