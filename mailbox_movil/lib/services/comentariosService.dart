import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mailbox_movil/rutas.dart';
import 'package:provider/provider.dart';
import 'package:mailbox_movil/models/comentarioModel.dart';


class comentarioService with ChangeNotifier{
  final String _apiUrl =rutas().apiUrl;
final String ruta = rutas().vercomentarios;
String Token ='';
String idNoticia ='';

List<Datum> comentario =[];

comentarioService(xtoken, id){
Token =xtoken;
idNoticia =id;
getComentarios();
}

   getComentarios()async {

  final Map<String,String> request ={

    'news_id': '$idNoticia'

};


final url = Uri.http(_apiUrl,ruta);

http.Response respuesta = await http.post(url,
headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $Token'
},
body: request);

final comentarioRespuest = comentariosFromJson(respuesta.body);
comentario.addAll(comentarioRespuest.data);

notifyListeners();


//getComentarios fin

   }






}