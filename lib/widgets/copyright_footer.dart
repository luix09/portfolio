import 'package:flutter/material.dart';

class CopyrightFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blueGrey
      ),
      child: Center(
        child: Text(
          "Copyright 2020 @ Luigi Cuomo",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
