import 'package:disenos_app/src/pages/pages.dart';
import 'package:disenos_app/src/transition/pagina2_page.dart';
import 'package:flutter/material.dart';



class Pagina1Page extends StatefulWidget {

  @override
  State<Pagina1Page> createState() => _Pagina1PageState();
}

class _Pagina1PageState extends State<Pagina1Page> {
  late AnimationController animateController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Página'),
      ),
      body: Center(
        child:  Container(
          width: 70,
          height: 70,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.push(context, _crearRuta() );
              
            }
          ),
        ),
     ),
     
   );
  }

  Route _crearRuta() {


    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => Pagina2Page(),
      transitionDuration: Duration(seconds: 2),
      transitionsBuilder: ( context, animation, secondaryAnimation, child ) {

        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut );

        return SlideTransition(
          position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero ).animate(curvedAnimation),
          child: child,
        );


      }
      );


  }
}


// class _CuboBlanco extends StatefulWidget {
//   const _CuboBlanco({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<_CuboBlanco> createState() => _CuboBlancoState();
// }

// class _CuboBlancoState extends State<_CuboBlanco> with TickerProviderStateMixin{

//   late AnimationController controller;
//   late Animation<double> tamano;
//   late Animation<double> opacidad;
//   late Animation<double> moverDerecha;
//   late Animation<double> moverArriba;

//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(
//         milliseconds: 1000
//       )
//     );

//     tamano = Tween(begin: 1.0, end: 15.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
//     moverDerecha = Tween(begin: -150.0, end: 300.0).animate(controller);
//     moverArriba = Tween(begin: -100.0, end: -300.0).animate(controller);
//     controller.addListener(() { 
//       if(controller.status == AnimationStatus.completed){
//         controller.reverse();
        

//       }
//     });

//     opacidad = Tween(begin: 1.0, end: 0.2).animate(controller);


//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //final botonActivado = Provider.of<_CuboBlanco>(context);
//     //(botonActivado==true) ? controller.forward() : controller.reset();

//     return AnimatedBuilder(
//       animation: controller,
//       child: _Rectangulo(),
//       builder: (BuildContext context, Widget? childRectangulo) {
//         return Transform.translate(
//           offset: Offset(0,moverArriba.value),
//           child: Transform.translate(
//             offset: Offset(moverDerecha.value,400),
//             child: Transform.scale(
//               scaleY: tamano.value,
//               child: Opacity(
//                 opacity: opacidad.value,
//                 child: childRectangulo,
//                 )
//               ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _Rectangulo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 70,
//       height: 70,
//       decoration: const BoxDecoration(color: Colors.white),
//     );
//   }
// }