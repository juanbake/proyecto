import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mailbox_movil/models/modelUsuario.dart';
import 'package:mailbox_movil/rutas.dart';

class perfilService with ChangeNotifier {
  final String _apiUrl = rutas().apiUrl;
  final String ruta = rutas().perfil;

  String Token = '';
  bool _isLoad = true;
  List<Data> usuario = [];

  perfilService(xtoken) {
    Token = xtoken;

    getUsuario();
  }

  getUsuario() async {
    final url = Uri.http(_apiUrl, ruta);

    http.Response respuesta = await http.get(url, headers: {
      'Acept': 'application/json',
      'Authorization': 'Bearer $Token'
    });

    final usuarioRespuest = usuarioInfoFromJson(respuesta.body);

    usuario.add(usuarioRespuest.data);
    print('morirme');
    print(usuario[0].email);
    _isLoad = false;
    notifyListeners();
  }
}
