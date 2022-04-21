import 'package:flutter/material.dart';

class userProvider extends ChangeNotifier{

int id=0;
String name ='';
String surname ='';
String career ='';
String email ='';

  
  
  



  setDatosUser(x) {
   
    notifyListeners();
  }




}