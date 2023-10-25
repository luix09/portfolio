import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/utils/device_info.dart';
import 'package:portfolio_web/widgets/topbar.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

class HelloWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = MediaQuery.of(context).size.width;
      if (width > SizeConfig.screenBreakpoint) {
        return DesktopHello();
      } else {
        return MobileHello();
      }
    });
  }
}

class DesktopHello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MySelfSection(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BottomSection(),
          ),
          SizedBox(height: 150),
        ],
      ),
    );
  }
}

class MobileHello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 50,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MySelfSection(),
          SizedBox(height: SizeConfig.heightMultiplier),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BottomSection(),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

class MySelfSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Expanded(
      child: width > SizeConfig.screenBreakpoint
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("res/propic_gigi.jpg"),
                      radius: MediaQuery.of(context).size.width <
                              SizeConfig.screenBreakpoint
                          ? SizeConfig.imageSizeMultiplier * 15
                          : 150,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 3),
                Flexible(
                  child: SelectableText(
                    "Luigi Cuomo,\nMobile developer.",
                    textAlign: TextAlign.center,
                    showCursor: false,
                    toolbarOptions: ToolbarOptions(
                        copy: true, selectAll: true, cut: false, paste: false),
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("res/profile_picture.jpg"),
                      radius: MediaQuery.of(context).size.width <
                              SizeConfig.screenBreakpoint
                          ? SizeConfig.imageSizeMultiplier * 15
                          : 150,
                    ),
                  ),
                ),
                SizedBox(width: SizeConfig.heightMultiplier * 3),
                Flexible(
                  child: SelectableText(
                    "Luigi Cuomo,\nMobile developer.",
                    textAlign: TextAlign.center,
                    showCursor: false,
                    toolbarOptions: ToolbarOptions(
                        copy: true, selectAll: true, cut: false, paste: false),
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2.5,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class TopMenu extends StatelessWidget {
  final List allSections;
  final ScrollController scrollController;

  TopMenu({required this.allSections, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = MediaQuery.of(context).size.width;

      return width > SizeConfig.screenBreakpoint
          ? DesktopAppBar(
              scrollController: scrollController, allSections: allSections)
          : Center(child: MobileAppBar());
    });
  }
}

class BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth > SizeConfig.screenBreakpoint
          ? DesktopBottomSection()
          : MobileBottomSection();
    });
  }
}

class DesktopBottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Text("Mobile and \nWeb Developer",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline4),
        ),
        SizedBox(width: 60),
        Flexible(
          child: Text("Phone:\n+39 392 162 1390",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline4),
        ),
        SizedBox(width: 60),
        Flexible(
          child: Text("Contact me:\ncuomoluigi09@gmail.com",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline4),
        ),
      ],
    );
  }
}

class MobileBottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mobile and \nWeb Developer",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Phone:\n+39 392 162 1390",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Contact me:\ncuomoluigi09@gmail.com",
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}
