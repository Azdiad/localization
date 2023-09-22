import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInCirc,
      child: IconButton(
        icon: Icon(
          Icons.favorite,
          color: isFavorited ? Colors.red : Colors.grey[400],
          size: isFavorited ? 40 : 30,
        ),
        onPressed: () {
          setState(() {
            isFavorited = !isFavorited;
          });
        },
      ),
    );
  }
}
