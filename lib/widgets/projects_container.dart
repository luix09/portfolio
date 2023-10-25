import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/utils/device_info.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsContainer extends StatefulWidget {
  @override
  _ProjectsContainerState createState() => _ProjectsContainerState();
}

class _ProjectsContainerState extends State<ProjectsContainer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      double height = 0;
      double projectWidth = 0;
      double projectHeight = 0;

      if (maxWidth >= 1555) {
        height = 900;
        projectWidth = 1500;
        projectHeight = 700;
      } else if (maxWidth >= 950) {
        height = 600;
        projectWidth = 1000;
        projectHeight = 400;
      } else {
        height = 700;
        projectWidth = 800;
        projectHeight = 500;
      }
      return Container(
        padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 16, vertical: 40),
        height: height,
        width: constraints.maxWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Projects",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: constraints.maxWidth < 1100 ?
                    SizeConfig.textMultiplier * 3 : 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: projectHeight,
                width: projectWidth,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(2, 5))
                    ]),
                child: constraints.maxWidth > 750 ?
                    DesktopCardContent() : MobileContentCard()
              ),
            ),
          ],
        ),
      );
    });
  }
}


class DesktopCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: Image.network("res/dbh_home2.gif",
                      fit: BoxFit.scaleDown))),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.widthMultiplier * 1.8,
                        top: 20.0),
                    child: Text(
                      "Dragon Ball Hub - Mobile App",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                ProjectDescription(),
                Spacer(),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.widthMultiplier * 1.8,
                        bottom: 50),
                    child: RichText(
                      text: TextSpan(
                        text: "To learn more about this project...",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url =
                                "https://github.com/Codeek89/Dragon-Ball-Hub";
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MobileContentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.network("res/dbh_home2.gif",
                      fit: BoxFit.scaleDown)
              )
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                "Dragon Ball Hub - Mobile App",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Theme.of(context).textTheme.subtitle1
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: RichText(
                text: TextSpan(
                  text: "To learn more about this project...",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      var url =
                          "https://github.com/Codeek89/Dragon-Ball-Hub";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



class ProjectDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier * 1.8,
                  top: 20),
              child: Text(
                "This is a project made for all Dragon Ball fans and it aims to keep updated all of them, notifying for news and let them read/watch about the manga, anime and so on.",
                style: Theme.of(context).textTheme.bodyText2
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier * 1.8,
                  top: 20),
              child: Text(
                "Technologies used: \n\u2022 Flutter;\n\u2022 PHP;\n\u2022 MySQL;",
                style: Theme.of(context).textTheme.bodyText2
              ),
            ),
          ]),
    );
  }
}

