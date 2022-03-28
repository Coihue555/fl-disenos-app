
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos_app/src/pages/pages.dart';
import 'package:disenos_app/src/theme/theme.dart';

import 'package:disenos_app/src/models/layout_model.dart';


void main() => runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => new ThemeChanger( 2 )),
      ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel()),
    ],
    child: MyApp(),
  ));


// void main() => runApp(
//     ChangeNotifierProvider(create: (_) => ThemeChanger(0), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home:  DemoScreen(),
      // home: OrientationBuilder(
      //   builder: (BuildContext context, Orientation orientation ){
      //    final screenSize = MediaQuery.of(context).size;
      //    if(screenSize.width>500){
      //      return LauncherTabletScreen();
      //    } else {
      //      return LauncherScreen();
      //    }
      //   }
      //   ),
    );
  }
}
