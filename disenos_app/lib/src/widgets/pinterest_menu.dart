import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton{
  final Function() onPressed;
  final IconData icon;

  PinterestButton({ 
    required this.onPressed,
    required this.icon});

}


class PinterestMenu extends StatelessWidget {

  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: (){ }),
    PinterestButton(icon: Icons.search, onPressed: (){ }),
    PinterestButton(icon: Icons.mail, onPressed: (){ }),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ }),
  ];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        create: ( _ ) => _MenuModel(),
        child: _PinterestMenuBackground(
          child: _MenuItems(items),
         ),
      ));
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;
  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
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

  const _MenuItems( this.menuItems );

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

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: (Provider.of<_MenuModel>(context).itemSeleccionado){},
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: 30,
          color: ( itemSeleccionado == index ) ? Colors.black : Colors.blueGrey,
          ),
      ),
    );
  }
}


class _MenuModel extends ChangeNotifier{
  int _itemSeleccionado = 0;
  
  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado( int index ){
    this._itemSeleccionado = index;
    notifyListeners();
  }
}