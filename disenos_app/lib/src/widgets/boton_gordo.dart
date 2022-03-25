import 'package:flutter/material.dart';

class BotonGordo extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return _BotonGordoBackground();
  }
}

class _BotonGordoBackground extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow()
        ]
      ),
    );
  }
}