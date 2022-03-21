import 'package:flutter/material.dart';


class CuadradoAnimadoPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado()
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;


  @override
  void initState() {
      controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500)
    );

    moverDerecha = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.easeOut)
        )
      );

    moverArriba = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.5, curve: Curves.easeOut)
        )
      );

    moverIzquierda = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.easeOut)
        )
      );
    
    moverAbajo = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)
        )
      );

    controller.addListener(() {
      
      if  (controller.status == AnimationStatus.completed ){
        controller.repeat();
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

        //en lugar de 4 transforms podria haber puesto:
        //offset: Offset(moverDerecha.value + moverIzquierda, moverArriba.value + moverAbajo.value),
        return Transform.translate(
          offset: Offset(0, moverAbajo.value),
          child: Transform.translate(
            offset: Offset(-moverIzquierda.value, 0),
            child: Transform.translate(
              offset: Offset(0, -moverArriba.value),
              child: Transform.translate(
                offset: Offset(moverDerecha.value, 0),
                child: childRect,
              ),
            ),
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
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}