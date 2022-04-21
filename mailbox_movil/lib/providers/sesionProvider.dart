import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class sesionProvider extends ChangeNotifier{

GlobalKey<FormState> sesionKey = GlobalKey<FormState>();

String keySesion =" ";

String? datoKey(String dato){
keySesion = dato;
notifyListeners();


}



}