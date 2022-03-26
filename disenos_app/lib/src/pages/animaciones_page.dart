import 'package:flutter/material.dart';
import 'dart:math' as Math;


class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {


  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000)
    );
    rotacion = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut
        )
      );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)
        )
    );

    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)
        )
    );

    moverDerecha = Tween(begin: 0.0, end:200.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut
        )
    );

    agrandar = Tween(begin: 0.5, end: 8.0).animate(controller);
    

    controller.addListener(() {
      
      if  (controller.status == AnimationStatus.completed ){
        //controller.reverse();
        controller.reverse();
      }
    });

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
      builder: (BuildContext context, Widget? childRect) {

        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: Opacity(
                  opacity: opacidadOut.value,
                  child: childRect)),
              )
            ),
        );
      },
    );
  }
}



class _Rectangulo extends StatelessWidget {
  @override
  Widget build( BuildContext context ) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}