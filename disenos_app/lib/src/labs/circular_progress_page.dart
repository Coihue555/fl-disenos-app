import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{
  
  late AnimationController controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;


  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800)
    );

    controller.addListener(() {
      //print('Valor controller: ${controller.value}');
      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      setState(() {
        
      });
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.green.shade200,
        onPressed: (){
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if (nuevoPorcentaje>100){
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }
          controller.forward(from: 0.0);
          setState(() {
            
          });
        },
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      )
    );
  }
}


class _MiRadialProgress extends CustomPainter{

  final double porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {


    //circulo
    final paint     = Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    final  Offset center = Offset(size.width*.5, size.height*.5);
    final  double radio  = min(size.width*.5, size.height*.5);

      canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color       = Colors.green.shade200
      ..style       = PaintingStyle.stroke;
    
    double arcAngle = 2 * pi * ( porcentaje/100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi/2, 
      arcAngle, 
      false, 
      paintArco
    );


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}