import 'package:flutter/material.dart';
import 'dart:math';

class RadialProgress extends StatefulWidget {
  
  final porcentaje;
  final Color? colorPrimario;
  final Color? colorSecundario;

  RadialProgress({
    required this.porcentaje,
    this.colorPrimario   = Colors.blue,
    this.colorSecundario = Colors.grey
    });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200)
    );
    
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from:0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child){
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress( (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar*controller.value),
            widget.colorPrimario,
            widget.colorSecundario!
            ),
          ),
        );
      },
    );

  }
}


class _MiRadialProgress extends CustomPainter{

  final porcentaje;
  final Color? colorPrimario;
  final Color colorSecundario;

  _MiRadialProgress(
    this.porcentaje, 
    this.colorPrimario, 
    this.colorSecundario
    );

  @override
  void paint(Canvas canvas, Size size) {


    //circulo
    final paint     = Paint()
      ..strokeWidth = 4
      ..color       = colorSecundario!
      ..style       = PaintingStyle.stroke;

    final  Offset center = Offset(size.width*.5, size.height*.5);
    final  double radio  = min(size.width*.5, size.height*.5);

      canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color       = colorPrimario!
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