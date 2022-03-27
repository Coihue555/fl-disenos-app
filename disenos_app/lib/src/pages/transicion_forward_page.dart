import 'package:disenos_app/src/pages/animaciones_page.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  bool activar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: const Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              activar = true;
            });
          }),
      backgroundColor: const Color(0xff1da1f2),
      body: Center(child: CuadradoAnimado()),
    );
  }
}
