import 'package:flutter/material.dart';
import 'package:portfolio_web/screens/home.dart';
import 'package:portfolio_web/utils/device_info.dart';
import 'package:portfolio_web/utils/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig.init(constraints, orientation);
        return ChangeNotifierProvider(
          create: (_) => ThemeChangeNotifier(),
          child: Consumer<ThemeChangeNotifier>(
            builder: (context, theme, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: theme.lightTheme,
              initialRoute: "/home",
              routes: {
                "/home": (context) => HomePage(),
              },
            ),
          ),
        );
      });
    });
  }
}
