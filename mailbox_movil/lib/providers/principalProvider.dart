import 'package:flutter/material.dart';

class principalProvider extends ChangeNotifier{

  int currentIndex = 0;
  
  GetcurrentIndex(){
    return currentIndex;
  }
  



  setcurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }




}