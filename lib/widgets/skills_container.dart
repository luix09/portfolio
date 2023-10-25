import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/models/skill_model.dart';
import 'package:portfolio_web/utils/device_info.dart';

class SkillsContainer extends StatefulWidget {
  @override
  _SkillsContainerState createState() => _SkillsContainerState();
}

class _SkillsContainerState extends State<SkillsContainer> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      double cardWidth = 0;
      double height = 0;

      if (maxWidth >= 1700) {
        height = 400;
        cardWidth = 400;
      } else if (maxWidth >= 1200) {
        height = 670;
        cardWidth = 400;
      } else if (maxWidth >= 750) {
        height = 670;
        cardWidth = 300;
      } else {
        height = 1200;
        cardWidth = 450;
      }

      return Container(
        height: height,
        width: maxWidth,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopHeading(width: maxWidth),
            SizedBox(height: 50),
            SkillsGroup(
                height: height,
                width: maxWidth,
                cardWidth: cardWidth),
          ],
        ),
      );
    });
  }
}

class TopHeading extends StatelessWidget {
  final double width;
  TopHeading({required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 15),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          "My Skills",
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: width < 1100
                    ? SizeConfig.textMultiplier * 3
                    : 40,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class SkillsGroup extends StatelessWidget {
  final double height;
  final double width;
  final double cardWidth;
  SkillsGroup({
    required this.height,
    required this.width,
    required this.cardWidth});

  final List<SkillModel> allSkills = [
    SkillModel(
        images: ["res/flutter_icon.jpg", "res/android_icon.png"],
        title: "Mobile Developer",
        description: "Good knowledge of the Flutter framework.\n"
            "He can use Java or Kotlin for Android development."),
    SkillModel(
        images: ["res/python-icon.png", "res/java.jpg"],
        title: "OOP Developer",
        description: "Programming in Python and PHP.\n"
            "Grasp knowledge of server-side programming and REST."),
    SkillModel(
        images: ["res/git_logo.png", "res/github_logo.png"],
        title: "Git and GitHub",
        description: "Good knowledge of Version Control Systems.\n"
            "Excellent abilities with Git and Github."),
    SkillModel(
        images: ["res/mysql_logo.png", "res/oracle_logo.png"],
        title: "RDBMS and SQL",
        description: "Excellent skills in SQL.\n"
            "He uses relational databases everyday."),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.5,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: width / 15),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            ...allSkills.map((e) {
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin:
                  EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  height: 250,
                  width: cardWidth,
                  child: SkillCard(model: e));
            })
          ],
        ));
  }
}


class TechIcon extends StatelessWidget {
  final String image;

  TechIcon({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        child: Image(image: AssetImage(image), fit: BoxFit.contain));
  }
}

class SkillCard extends StatelessWidget {
  final SkillModel model;

  SkillCard({required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ...model.images.map((e) {
                  return FittedBox(
                      fit: BoxFit.contain, child: TechIcon(image: e));
                }).toList(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "${model.title}",
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                softWrap: false,
                style: Theme.of(context).textTheme.headline2
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(children: [
              Text(
                "${model.description}",
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                softWrap: false,
                style: Theme.of(context).textTheme.bodyText2
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
