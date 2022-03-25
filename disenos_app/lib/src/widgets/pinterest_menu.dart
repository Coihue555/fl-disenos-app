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

  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;      
  final Color inactiveColor;
  final List<PinterestButton> items;    


  // final List<PinterestButton> items = [
  //   PinterestButton(icon: Icons.pie_chart, onPressed: (){ }),
  //   PinterestButton(icon: Icons.search, onPressed: (){ }),
  //   PinterestButton(icon: Icons.mail, onPressed: (){ }),
  //   PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){ }),
  // ];

  PinterestMenu({
    this.mostrar         = true,
    this.backgroundColor = Colors.white,
    this.activeColor     = Colors.black,
    this.inactiveColor   = Colors.blueGrey,
    required this.items
    });


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: ( mostrar ) ? 1 : 0,
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor     = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor   = inactiveColor;
            return _PinterestMenuBackground(
              child: _MenuItems(items),
             );
          }
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;
  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
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
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: ( itemSeleccionado == index ) ? 30 : 20,
          color: ( itemSeleccionado == index ) ? menuModel.activeColor : menuModel.inactiveColor,
          ),
      ),
    );
  }
}


class _MenuModel extends ChangeNotifier{
  int _itemSeleccionado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor     = Colors.black;
  Color inactiveColor   = Colors.blueGrey;
  
  int get itemSeleccionado => this._itemSeleccionado;
  set itemSeleccionado( int index ){
    this._itemSeleccionado = index;
    notifyListeners();
  }
}