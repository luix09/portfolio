import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_web/utils/device_info.dart';
import 'package:portfolio_web/widgets/about_me_widget.dart';
import 'package:portfolio_web/widgets/copyright_footer.dart';
import 'package:portfolio_web/widgets/hello_widget.dart';
import 'package:portfolio_web/widgets/topbar.dart';
import 'package:portfolio_web/widgets/projects_container.dart';
import 'package:portfolio_web/widgets/skills_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController = ScrollController();
  static const int count = 4;
  late var scrolledSection;

  List allSections = [
    {'key': GlobalKey(), 'selected': false},
    {'key': GlobalKey(), 'selected': false},
    {'key': GlobalKey(), 'selected': false},
    {'key': GlobalKey(), 'selected': false},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changeSection);
    setState(() {
      scrolledSection = allSections[0];
      scrolledSection['selected'] = true;
    });
  }

  changeSection() {
    var maxScrollVal = _scrollController.position.maxScrollExtent;

    var divisor = (maxScrollVal / count);

    var scrollValue = _scrollController.offset.round();
    var slideValue = (scrollValue / divisor).round();

    setState(() {
      if (slideValue < count) {
        scrolledSection = allSections[slideValue];
        scrolledSection['selected'] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
          Scaffold(
            drawer: constraints.maxWidth < SizeConfig.screenBreakpoint ?
                MyDrawer(
                    allSections: allSections,
                    scrollController: _scrollController)
                : null,
            body: SafeArea(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    flexibleSpace: TopMenu(allSections: allSections,
                        scrollController: _scrollController),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      key: allSections[0]['key'],
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF325288), Color(0xFF150e56)]
                          )
                      ),
                      child: HelloWidget(),
                    ),
                  ),
                  // Skills section
                  SliverToBoxAdapter(
                    child: AnimatedCrossFade(
                      key: allSections[1]['key'],
                      firstChild: SkillsContainer(),
                      secondChild: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        color: Colors.transparent,
                      ),
                      duration: Duration(seconds: 1),
                      crossFadeState: allSections[1]['selected']
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
                      child: Divider(),
                    )
                  ),
                  // Projects section
                  SliverToBoxAdapter(
                    child: AnimatedCrossFade(
                      key: allSections[2]['key'],
                      firstChild: ProjectsContainer(),
                      secondChild: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        color: Colors.transparent,
                      ),
                      duration: Duration(seconds: 1),
                      crossFadeState: allSections[2]['selected']
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
                        child: Divider(),
                      )
                  ),
                  SliverToBoxAdapter(
                    child: AnimatedCrossFade(
                      key: allSections[3]['key'],
                      firstChild: AboutMeWidget(),
                      secondChild: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 200,
                        color: Colors.transparent,
                      ),
                      duration: Duration(seconds: 1),
                      crossFadeState: allSections[3]['selected']
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CopyrightFooter(),
                  )
                ],
              ),
            ),
          )
    );
  }
}
