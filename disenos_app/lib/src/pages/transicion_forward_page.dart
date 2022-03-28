import 'package:flutter/material.dart';
import 'package:disenos_app/src/transition/pagina2_page.dart';



class DemoScreen extends StatefulWidget { 

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      body:  Center(
        child: _CuboBlanco(

        )
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
          milliseconds: 600
        )
      );
    

    tamano = Tween(begin: 1.0, end: 1.5).animate(controller);
    moverDerecha = Tween(begin: -100.0, end: 300.0).animate(controller);
    moverArriba = Tween(begin: -100.0, end: -100.0).animate(controller);
    opacidad = Tween(begin: 1.0, end: 0.0).animate(controller);

    controller.addListener(() {
        if(controller.status == AnimationStatus.completed){
          controller.reset();
          
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

    
    return AnimatedBuilder(
      animation: controller,
      child: GestureDetector(
        onTap:() {
          Navigator.push(context, _crearRuta() );
          controller.forward();
        },
        child: _Rectangulo()
      ),
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



  Route _crearRuta() {


    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => Pagina2Page(),
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: ( context, animation, secondaryAnimation, child ) {

        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOut );

        return SlideTransition(
          position: Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero ).animate(animation),
          child: child,
        );


      }
      );


  }
