import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';


class LoginFromProvider extends ChangeNotifier{

GlobalKey<FormState> formKey = GlobalKey<FormState>();

String email = "";
String password = "";
bool vercampoContra = true;
bool simular =false;
bool isLoading =false;

simularCarga(){
  simular=!simular;
  notifyListeners();
}

bool isValidFrom(){
  isLoading =!isLoading;
return formKey.currentState?.validate()??false;

}

campoContra(){
vercampoContra = !vercampoContra;
notifyListeners();

}




}