import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      body:  Center(
        child: _CuboBlanco()
      ),
    );
  }
}

class _CuboBlanco extends StatefulWidget {
  @override
  State<_CuboBlanco> createState() => _CuboBlancoState();
}

class _CuboBlancoState extends State<_CuboBlanco> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> tamano;
  late Animation<double> opacidad;
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000
      )
    );

    tamano = Tween(begin: 1.0, end: 15.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    moverDerecha = Tween(begin: -150.0, end: 300.0).animate(controller);
    moverArriba = Tween(begin: -100.0, end: -300.0).animate(controller);
    controller.addListener(() { 
      if(controller.status == AnimationStatus.completed){
        controller.reverse();
      }
    });

    opacidad = Tween(begin: 1.0, end: 0.2).animate(controller);


    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        return Transform.translate(
          offset: Offset(0,moverArriba.value),
          child: Transform.translate(
            offset: Offset(moverDerecha.value,400),
            child: Transform.scale(
              scaleY: tamano.value,
              child: Opacity(
                opacity: opacidad.value,
                child: childRectangulo,
                )
              ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.white),
    );
  }
}
