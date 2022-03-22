import 'package:flutter/material.dart';

class PinterestButton{
  final Function() onPressed;
  final IconData icon;

  PinterestButton({ 
    required this.onPressed,
    required this.icon});

}


class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon pie_chart');}),
    PinterestButton(icon: Icons.search, onPressed: (){print('Icon search');}),
    PinterestButton(icon: Icons.mail, onPressed: (){print('Icon mail');}),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon user');}),
  ];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: _PinterestMenuBackground());
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;
  const _PinterestMenuBackground();

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            blurRadius: 10,
            color: Colors.black38,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  _MenuItems( this.menuItems );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton( index, menuItems[index] ) )
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(
    this.index,
    this.item
  );
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: 30,
          color: Colors.blueGrey,
          ),
      ),
    );
  }
}