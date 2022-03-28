import 'package:disenos_app/src/pages/pages.dart';
import 'package:flutter/material.dart';

class LayoutModel extends ChangeNotifier{
  
  Widget _currentPage = SlideshowPage();
  
  set currentPage(Widget page){
    this._currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => this._currentPage;

}