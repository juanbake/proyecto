import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mailbox_movil/rutas.dart';

class AuthService extends ChangeNotifier{

final String _apiUrl =rutas().apiUrl;
final String ruta = rutas().sesion;
 String token = '';
 String idUsuario ="";
 

 Future<bool> login(String email, String password) async{

final Map<String,String> request ={
'email': email+'@estudiantes.upqroo.edu.mx',
'password': password
};

final url = Uri.http(_apiUrl,ruta);

final resp = await http.post(url,body: request).timeout(const Duration(seconds: 90));

final datos= jsonDecode(resp.body);

if(datos["status"]){
  token=datos["access_token"];
  return true;
}else{
  return false;
}

}

 getToken(){


  return token;
}

setid(id)
{
idUsuario = id.toString();
}

}