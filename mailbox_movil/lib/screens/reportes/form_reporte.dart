
import 'package:mailbox_movil/screens/reportes/list_reporte.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mailbox_movil/screens/principal.dart';

class FormReport extends StatefulWidget {
  

  @override
  State<FormReport> createState() => _FormReport();
}

bool activo = true;

String zonas = "Especifique la Zona";
String textP = "Describa el problema";
String textf = "Escriba la Zona";

List<String> items = <String>[
  "Planta Baja",
  "Planta Alta",
];
List<String> imagenes = <String>[
  "https://i.imgur.com/tnLzv2f.jpg",
  "https://i.imgur.com/5TvW9b2.jpg "
];
int foto = 0;
String inicial = "Planta Baja";
bool check = false;

class Estatica {
  static String zona = "Planta Baja";
  static String valor = "Especifique la Zona";
}

final _keyForm = GlobalKey<FormState>();

class _FormReport extends State<FormReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
        
          cuerpo(),
        
      ),
    );
  }

  Widget cuerpo() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            espacio(),
            info(),
            espacio(),
            selecPlanta(),
            espacio(),
            zona(),
            espacio(),
            reporte(),
            espacio(),
            botonForm(),
          ],
        ),
      ),
    );
  }

  AppBar app() {
    return AppBar(
      backgroundColor: const Color(0xFF795548),
      automaticallyImplyLeading: false,
      title: const Text(
        'Formulario de Reporte',
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 20, 10),
          child: Container(
            width: 50,
            height: 50,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              'https://picsum.photos/seed/259/600',
            ),
          ),
        ),
      ],
      centerTitle: false,
      elevation: 2,
    );
  }

  Widget espacio() {
    return const SizedBox(height: 15);
  }

  Widget info() {
    return Row(children: <Widget>[
      imagenZona(),
      const SizedBox(width: 10),
      textZona(),
    ]);
  }

  Widget imagenZona() {
    return const CircleAvatar(
      radius: 45,
      backgroundImage: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/3/35/LogotipoUPQROO.png"),
    );
  }

  Widget textZona() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textZonaLugar(),
          const SizedBox(height: 10),
          textZonaPiso()
        ]);
  }

  Widget textZonaLugar() {
    return Text(Estatica.zona,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget textZonaPiso() {
    return Text(Estatica.valor,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget selecPlanta() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Text("Eliga la Planta:",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(width: 5),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: DropdownButton<String>(
                dropdownColor: Colors.orangeAccent,
                elevation: 5,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                isExpanded: false,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                onChanged: (newValue) {
                  setState(() {
                    inicial = newValue!;

                    Estatica.valor = newValue;
                    if (Estatica.valor == "Planta Alta") {
                      foto = 1;
                    } else {
                      foto = 0;
                    }
                  });
                },
                value: inicial,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }

  Widget zona() {
    return Column(
      children: [
        textMapa(),
        espacio(),
        imagenMapa(),
        espacio(),
        textoMapa(),
        espacio(),
        boxMapa(),
      ],
    );
  }

  Widget textMapa() {
    return const Text("Identifique la Zona",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget imagenMapa() {
    return InteractiveViewer(
      child: Image(
        image: NetworkImage(imagenes[foto]),
      ),
    );
  }

  Widget textoMapa() {
    return TextFormField(
      onChanged: ((value) {
        setState(() {
          if (value.isNotEmpty) {
            zonas = value;
            Estatica.valor = value;
          } else {
            zonas = Estatica.valor = "Especifique la Zona";
          }
        });
      }),
      validator: ((value) {
        if (Estatica.valor == "Especifique la Zona") {
          return "Por favor, eliga una zona";
        }
        return null;
      }),
      decoration: InputDecoration(
        labelText: textf,
        suffixIcon: const Icon(Icons.add_comment_outlined),
        isDense: true,
        enabled: activo,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget boxMapa() {
    return CheckboxListTile(
      title: const Text(
        "No se encontro la zona",
      ),
      secondary: const Icon(Icons.error_outline),
      value: check,
      onChanged: (value) {
        setState(() {
          check = value!;
          if (check == true) {
            Estatica.valor = "No se encontro la Zona";
            textf = "Deshabilidado por zona no encontrada";
            textP += " y escriba la zona";
            activo = false;
          } else {
            Estatica.valor = zonas;
            textf = "Escriba la Zona";
            textP = "Detalle el problema";
            activo = true;
          }
        });
      },
    );
  }

  Widget reporte() {
    return Column(
      children: [
        seleccionImagen(),
        espacio(),
        textoProblema(),
      ],
    );
  }

  File? imagenFile;
  String tmp = "Subir Imagen de la Evidencia";
  final picker = ImagePicker();
  Widget seleccionImagen() {
    return ElevatedButton(
      onPressed: () {
        fotografia();
      },
      child: Text(
        tmp,
        style: TextStyle(color: col),
      ),
    );
  }

  Widget textoProblema() {
    return TextFormField(
      validator: ((value) {
        if (value == null || value.isEmpty) {
          return "Por favor detalle el problema";
        }

        return null;
      }),
      decoration: InputDecoration(
        labelText: textP,
        suffixIcon: const Icon(Icons.add_comment_outlined),
        isDense: true,
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        helperText: "Máximo 500 Carácteres",
      ),
      maxLength: 500,
      maxLines: 10,
      textAlignVertical: TextAlignVertical.top,
    );
  }

  bool booleano = false;

  Widget botonForm() {
    return ElevatedButton(
      onPressed: () {
        if (_keyForm.currentState!.validate() && booleano) {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Aviso Importante'),
                    content:
                        const Text('Los datos se han guardado correctamente'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const principal())),
                        child: const Text('Ok'),
                      ),
                    ],
                  ));
        } else {}
      },
      child: const Text("Enviar"),
    );
  }

  Color? col = Colors.white;
  fotografia() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      if (pickedFile != null) {
        booleano = true;
        col = Colors.green[900];
        tmp = "Imagen Guardada";
        imagenFile = File(pickedFile.path);
      }
    });
  }
}
