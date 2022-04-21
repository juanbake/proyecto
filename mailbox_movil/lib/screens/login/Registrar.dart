import 'package:flutter/material.dart';
import 'package:mailbox_movil/colores.dart';

class Registrar extends StatefulWidget {
  Registrar({Key? key}) : super(key: key);

  @override
  State<Registrar> createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Container(
                color: Colors.white,
                width: width,
                child: SingleChildScrollView(child: bienvenida()))));
  }
}

class bienvenida extends StatelessWidget {
  const bienvenida({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
                      children: [
                        SizedBox(width: width,
                        height: height*1.45,),
                           Positioned(
                             top:20,
                             left:30,
                             child: Text.rich(
                              TextSpan(
                                  text: 'Crea una cuenta \n',
                                  style: TextStyle(
                                    color: colores().principal,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Y ayudanos a mantenerte \n',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'seguro.',
                                      style: TextStyle(
                                        color: colores().secundario,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 19.0,
                                      ),
                                    ),
                                  ]),
                                                     ),
                           ),
                       Positioned(
                         top: 65,
                         left:85,
                         child: Image.asset(
                              
                              'assets/images/registrar.png',
                              width:width*0.7   ),
                       ),
                             Positioned(
                               top:height*0.35,
                               child: SizedBox(
                                                   width: width*0.9,
                                                   child: Card(elevation: 20, child: Formulario())),
                             ),
                      
                      Positioned(
                        bottom: 0,
                        child: botonMail())]
                    )      ;
  }
}

class Formulario extends StatefulWidget {
  Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          nombre(),
          SizedBox(
            height: 40,
          ),
          campoNom(),
          SizedBox(
            height: 25,
          ),
          campoApe(),
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
            height: 30,
          ),
            RaisedButton(

                                child: Text('Registrar',style: TextStyle(color: colores().blanco)),
                                color: colores().principal,
                                onPressed: (){
Navigator.pushReplacementNamed(
                                      context, '/');
       
                                },
                              )
        ],
      ),
    );
  }
}

Widget nombre() {
  return Column(
    children: [
      Center(
          child: Text(
        "Registrar",
        style: TextStyle(
            color: colores().principal,
            fontSize: 25.0,
            fontWeight: FontWeight.bold),
      )),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          color: Colors.grey[300],
          height: 5,
          width: 60,
        ),
        Container(
          color: Color.fromARGB(255, 255, 103, 32),
          height: 5,
          width: 40,
        ),
        Container(
          color: Colors.grey[300],
          height: 5,
          width: 60,
        )
      ]),
    ],
  );
}

Widget campoNom() {
  return TextField(
    decoration: InputDecoration(
      labelText: "Nombre(s)",
      suffixIcon: Icon(Icons.people),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}

Widget campoApe() {
  return TextField(
    decoration: InputDecoration(
      labelText: "Apellidos",
      suffixIcon: Icon(Icons.people),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}

class campoCarrera extends StatefulWidget {
  campoCarrera({Key? key}) : super(key: key);

  @override
  State<campoCarrera> createState() => _campoCarreraState();
}

class _campoCarreraState extends State<campoCarrera> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = "Seleccionar";
    return DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: "Carrera",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 177, 175, 175)),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: dropdownItems);
  }
}

Widget campoCorreo() {
  return TextField(
    decoration: InputDecoration(
      labelText: "Matricula",
      suffixIcon: Icon(Icons.numbers),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  );
}

bool vercampoRep = true;
bool vercampoContra = true;

class campoContra extends StatefulWidget {
  campoContra({Key? key}) : super(key: key);

  @override
  State<campoContra> createState() => _campoContraState();
}

class _campoContraState extends State<campoContra> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: vercampoContra,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    vercampoContra = !vercampoContra;
                  });
                },
                icon: Icon(Icons.visibility_off)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )));
  }
}

class campoRep extends StatefulWidget {
  campoRep({Key? key}) : super(key: key);

  @override
  State<campoRep> createState() => _campoRepState();
}

class _campoRepState extends State<campoRep> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: vercampoRep,
        decoration: InputDecoration(
            labelText: 'Confirma contraseña',
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    vercampoRep = !vercampoRep;
                  });
                },
                icon: Icon(Icons.visibility_off)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )));
  }
}


class botonMail extends StatelessWidget {
  const botonMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    children:[ 
      
 GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text.rich(
                            TextSpan(
                              text: 'Ya tienes una cuenta? ',
                              children: [
                                TextSpan(
                                  text: 'Ingresa',
                                  style: TextStyle(
                                    color: Color(0xffEE7B23)
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ),
      
      SizedBox(height:30.0),
      Text(
      "MAILBOX",
      style: TextStyle(fontSize: 20, color: Colors.orange),
    ),
    ]);
  }
}






List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Seleccionar"), value: "Seleccionar"),
    DropdownMenuItem(child: Text("Ing. Software"), value: "Ing. Software"),
    DropdownMenuItem(
        child: Text("Ing. Biotecnologia"), value: "Ing. Biotecnologia"),
    DropdownMenuItem(child: Text("Ing. Financiera"), value: "Ing. Financiera"),
  ];
  return menuItems;
}
