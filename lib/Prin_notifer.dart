import 'dart:collection';

import 'package:flutter_app_screens/princlass.dart';
import 'package:flutter/cupertino.dart';

class PrinNotifer with ChangeNotifier{
  List<Prin> _prinList =[];
  Prin _currentPrin;
  UnmodifiableListView<Prin> get prinList =>UnmodifiableListView(_prinList);

  Prin get currentPrin => _currentPrin;


  set prinList(List<Prin> prinList){
        _prinList= prinList;
        notifyListeners();
  }
  set currentPrin(Prin prin){
    _currentPrin= prin;
    notifyListeners();
  }

}