import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/utils/device_info.dart';

class MenuEntry {
  String name;
  Icon icon;

  MenuEntry({required this.name, required this.icon});
}

class MyDrawer extends StatelessWidget {
  final List allSections;
  final ScrollController scrollController;

  final List<MenuEntry> menuElements = [
    MenuEntry(name: "Home", icon: Icon(Icons.home)),
    MenuEntry(name: "Skills", icon: Icon(Icons.keyboard)),
    MenuEntry(name: "Projects", icon: Icon(Icons.work_outline)),
    MenuEntry(name: "About me", icon: Icon(Icons.person)),
  ];

  MyDrawer({required this.allSections, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        height: SizeConfig.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "res/profile_picture.jpg",
                    height: SizeConfig.imageSizeMultiplier * 12,
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  Text("My Portfolio",
                      style: GoogleFonts.nunito(
                        letterSpacing: 0,
                        fontSize: SizeConfig.textMultiplier * 1.9,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("v1.0.1"),
                  SizedBox(height: SizeConfig.heightMultiplier),
                  Divider(),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                  child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: menuElements[index].icon,
                      title: Text(
                        menuElements[index].name,
                        style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.2,
                        ),
                      ),
                      onTap: () {
                        scrollController.position.ensureVisible(
                            allSections[index]['key']
                                .currentContext
                                .findRenderObject(),
                            alignment: 0, //1 if About me
                            duration: const Duration(seconds: 1));
                        Navigator.of(context).pop();
                      });
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: menuElements.length,
                padding: EdgeInsets.zero,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopAppBar extends StatelessWidget {
  final ScrollController scrollController;
  final List allSections;

  DesktopAppBar({required this.scrollController, required this.allSections});

  ButtonStyle buttonTextStyle(context) {
    return TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: Colors.transparent,
      textStyle: Theme.of(context).textTheme.button
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              child: Text("Home"),
              onPressed: () {
                scrollController.position.ensureVisible(
                    allSections[0]['key'].currentContext.findRenderObject(),
                    alignment: 0,
                    duration: const Duration(milliseconds: 1250));
              },
              style: buttonTextStyle(context)),
          SizedBox(width: 30),
          TextButton(
            child: Text("Skills"),
            onPressed: () {
              scrollController.position.ensureVisible(
                  allSections[1]['key'].currentContext.findRenderObject(),
                  alignment: 0,
                  duration: const Duration(milliseconds: 1250));
            },
            style: buttonTextStyle(context),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              scrollController.position.ensureVisible(
                  allSections[2]['key'].currentContext.findRenderObject(),
                  alignment: 0,
                  duration: const Duration(milliseconds: 1500));
            },
            child: Text("Projects"),
            style: buttonTextStyle(context),
          ),
          SizedBox(width: 30),
          TextButton(
            onPressed: () {
              scrollController.position.ensureVisible(
                  allSections[3]['key'].currentContext.findRenderObject(),
                  alignment: 0,
                  duration: const Duration(milliseconds: 1750));
            },
            child: Text("About Me"),
            style: buttonTextStyle(context),
          ),
        ],
      ),
    );
  }
}

class MobileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Portfolio",
      style: GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }
}