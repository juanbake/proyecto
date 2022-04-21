import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mailbox_movil/rutas.dart';
import 'package:provider/provider.dart';
import 'package:mailbox_movil/models/modelReporte.dart';

class listReporte with ChangeNotifier
{
  String idStudent = "";
 final String _apiUrl =rutas().apiUrl;
final String ruta = rutas().listRepote;
String Token ='';

List<Datum> listaReporte =[];

listReporte(xtoken,id){
Token = xtoken;
idStudent =id;
getReportes();
}

getReportes() async {

  final Map<String,String> request ={

    'student_id': '$idStudent'

};


final url = Uri.http(_apiUrl,ruta);

http.Response respuesta = await http.post(url,
headers: {
  'Accept':'application/json',
  'Authorization':'Bearer $Token'
},
body: request);

final listRespuest = reportesVwFromJson(respuesta.body);

listaReporte.addAll(listRespuest.data);
print(listaReporte[0].description);
notifyListeners();

}


}