import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615aab),
    );
  }
}

class HeaderRedondeado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70))
        ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadedDiagonalPainter(

        ),
      ),
    );
  }
}

class _HeadedDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  Paint();
    //propiedades
    lapiz.color = const Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    
    path.moveTo(0, size.height*0.3);
    path.lineTo(size.width, size.height*0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderTriangular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadedTriangularPainter(

        ),
      ),
    );
  }
}

class _HeadedTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  Paint();
    //propiedades
    lapiz.color = const Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    
    path.lineTo(0, size.height*.3);
    path.lineTo(size.width*.5, size.height*.35);
    path.lineTo(size.width, size.height*.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderCurvo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadedCurvoPainter(

        ),
      ),
    );
  }
}

class _HeadedCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  Paint();
    //propiedades
    lapiz.color = const Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    
    path.lineTo(0, size.height*.3);
    path.quadraticBezierTo(size.width*.5, size.height*.38, size.width, size.height*.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadedWavePainter(

        ),
      ),
    );
  }
}

class _HeadedWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz =  Paint();
    //propiedades
    lapiz.color = const Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    
    path.lineTo(0, size.height*.3);
    path.quadraticBezierTo(size.width*.25, size.height*.38, size.width*.5, size.height*.3);
    path.quadraticBezierTo(size.width*.75, size.height*.22, size.width, size.height*.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}



class HeaderWaveGradient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeadedWaveGradientPainter(

        ),
      ),
    );
  }
}

class _HeadedWaveGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(165.0, 55.0),
      radius: 180,
      );
    const Gradient gradiente = LinearGradient(
      colors: <Color>[
        Colors.amber,
        Colors.cyan
      ]);

    final lapiz =  Paint()..shader = gradiente.createShader(rect);
    //propiedades
    lapiz.color = const Color(0xff615aab);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 5;

    final path = Path();
    
    path.lineTo(0, size.height*.3);
    path.quadraticBezierTo(size.width*.25, size.height*.38, size.width*.5, size.height*.3);
    path.quadraticBezierTo(size.width*.75, size.height*.22, size.width, size.height*.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.color1 = Colors.blue,
    this.color2 = Colors.blueGrey
    });


  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(color1: color1, color2: color2,),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon( icon, size: 250, color: Colors.white.withOpacity(0.2),)
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity),
            Text( subtitulo, style: TextStyle( fontSize: 20, color: colorBlanco)),
            const SizedBox(height: 20,),
            Text( titulo, style: TextStyle( fontSize: 40, fontWeight: FontWeight.bold, color: colorBlanco)),
            const SizedBox(height: 20,),
            FaIcon( icon, size: 80, color: Colors.white,)
          ],)
      ],
      );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  
  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    required this.color1,
    required this.color2
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2
          ]
        )
      ),
    );
  }
}