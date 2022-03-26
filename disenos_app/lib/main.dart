import 'package:disenos_app/src/pages/transicion_forward_page.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
//import 'package:disenos_app/src/pages/pages.dart';
import 'package:provider/provider.dart';


void main()=> runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(0),
      child: MyApp()
    )
  );


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;  

    return  MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: const DemoScreen(),
    );
  }
}
