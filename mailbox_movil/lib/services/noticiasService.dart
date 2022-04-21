import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mailbox_movil/rutas.dart';
import 'package:provider/provider.dart';
import 'package:mailbox_movil/models/modelNoticias.dart';

class noticiasService with ChangeNotifier{
int idNota =0;

  final String _apiUrl =rutas().apiUrl;
final String ruta = rutas().listNoticias;
String Token ='';

List<Datum> noticias =[];

noticiasService(xtoken){
Token = xtoken;
getNotica();
}

getNotica()async {

final url = Uri.http(_apiUrl,ruta);

http.Response respuesta = await http.get(url,
headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $Token'
});


final noticiasRespuest =noticiasFromJson(respuesta.body) ;
print("---aqui ando---");
print(noticiasRespuest);
noticias.addAll(noticiasRespuest.data);
notifyListeners();

}


setNotaId(int index){
  idNota=index;
  notifyListeners();
}


}