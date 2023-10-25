import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/utils/device_info.dart';

class AboutMeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth / 15, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "About me",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: constraints.maxWidth < 1100
                          ? SizeConfig.textMultiplier * 3
                          : 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 50),
            Wrap(
              children: [
                Text(
                  "I am an Italian guy who likes technology "
                  "and computers. I spend a lot of time programming, "
                  "studying and having fun with my friends. "
                  "My favourite sport is football and my dream "
                  "is to realize an important app/program.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
