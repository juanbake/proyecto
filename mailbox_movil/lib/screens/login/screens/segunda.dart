import 'package:flutter/material.dart';

class segunda extends StatefulWidget {
  segunda({Key? key}) : super(key: key);
  @override
  _segunda createState() => _segunda();
}

class _segunda extends State<segunda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo2(),
    );
  }
}

Widget cuerpo2() {
  return Wrap(children: <Widget>[
  
    Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        nombre(),
        SizedBox(
          height: 15,
        ),
        campoNom(),
        SizedBox(
          height: 25,
        ),
        campoCarrera(),
        SizedBox(
          height: 25,
        ),
        campoCorreo(),
        SizedBox(
          height: 25,
        ),
        campoContra(),
        SizedBox(
          height: 25,
        ),
        campoRep(),
        SizedBox(
          height: 45,
        ),
        botonRegis(),
        botonMail()
      ],
    ),
  ]);
}

Widget nombre() {
  return Center(
      child: Text(
    "Registrar",
    style: TextStyle(
        color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
  ));
}

Widget campoNom() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Nombre",
        fillColor: Color.fromARGB(255, 204, 202, 202),
        filled: true,
      ),
    ),
  );
}

Widget campoCarrera() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Carrera",
        fillColor: Color.fromARGB(255, 204, 202, 202),
        filled: true,
      ),
    ),
  );
}

Widget campoCorreo() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Correo",
        fillColor: Color.fromARGB(255, 204, 202, 202),
        filled: true,
      ),
    ),
  );
}

Widget campoContra() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Color.fromARGB(255, 204, 202, 202),
        filled: true,
      ),
    ),
  );
}

Widget campoRep() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Confirmar Contraseña",
        fillColor: Color.fromARGB(255, 204, 202, 202),
        filled: true,
      ),
    ),
  );
}

Widget botonRegis() {
  return FlatButton(
      color: Colors.orangeAccent,
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      onPressed: () {},
      child: Text(
        "REGISTRARSE",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ));
}

Widget botonMail() {
  return Center(
    child: Text(
      "MAILBOX",
      style: TextStyle(fontSize: 20, color: Colors.orange),
    ),
  );
}
