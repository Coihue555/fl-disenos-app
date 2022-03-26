import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos_app/src/pages/pages.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshare', SlideshowPage() ),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest Layout', const PinterestPage() ),
  _Route(FontAwesomeIcons.truckMedical, 'Emergency UI', const EmergencyScreen() ),
  _Route(FontAwesomeIcons.barsProgress, 'Graficas circulares', const GraficasCircularesPage() ),
  _Route(FontAwesomeIcons.drawPolygon, 'Headers', const HeadersPage() ),
  _Route(FontAwesomeIcons.film, 'Animaciones', const AnimacionesPage() ),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverListScreen() ),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Cuadro animado', CuadradoAnimadoPage() ),

];

class _Route{
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(
    this.icon,
    this.titulo,
    this.page
  );

}