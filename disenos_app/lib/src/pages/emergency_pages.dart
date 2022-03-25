import 'package:disenos_app/src/widgets/boton_gordo.dart';
import 'package:flutter/material.dart';
import 'package:disenos_app/src/widgets/headers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyScreen extends StatelessWidget {
   
  const EmergencyScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BotonGordo(
        )
      )
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      titulo: 'Asistencia medica',
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz Solicitado',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2)
    );
  }
}