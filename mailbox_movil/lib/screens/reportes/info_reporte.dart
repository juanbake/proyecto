import 'package:flutter/material.dart';

class InfoRepoScreen extends StatelessWidget {
  const InfoRepoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          app(),
          cuerpo(),
        ],
      ),
    );
  }

  AppBar app() {
    return AppBar(
      backgroundColor: const Color(0xFF795548),
      automaticallyImplyLeading: false,
      title: const Text(
        'Información de Reporte',
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

  Widget cuerpo() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          space(10),
          encabezado(),
          space(50),
          detalles(),
          space(50),
          descripcion(),
          space(50),
          imagen(),
        ],
      ),
    );
  }

  Widget encabezado() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            const Icon(Icons.place_rounded, color: Colors.blue, size: 60),
            space2(10),
            reportZona("Planta Baja", "Laboratorio Software")
          ],
        ),
      ),
    );
  }

  Widget texto(String text, double? num, TextAlign ali, Color? col) {
    return Text(text,
        textAlign: ali,
        style: TextStyle(
          color: col,
          fontSize: num,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget space2(double? num) {
    return SizedBox(width: num);
  }

  Widget space(double? num) {
    return SizedBox(height: num);
  }

  Widget reportZona(String planta, String zona) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        texto(planta, 25, TextAlign.justify, Colors.red[900]),
        space(10),
        texto(zona, 15, TextAlign.justify, Colors.black),
      ],
    );
  }

  Widget detalles() {
    int folio = 1111;
    String estado = "Por revisar";
    String fecha = "18/04/2022";
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            texto(
                "Detalles del Reporte", 20, TextAlign.justify, Colors.red[900]),
            space(10),
            texto("Folio: " + folio.toString(), 16, TextAlign.justify,
                Colors.black),
            texto("Estado: " + estado, 16, TextAlign.justify, Colors.black),
            texto("Fecha de Creación: " + fecha, 16, TextAlign.justify,
                Colors.black),
          ],
        ),
      ),
    );
  }

  Widget descripcion() {
    String descrip = "Información breve sobre el reporte del Usuario.";
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            texto("Descripción del Reporte", 20, TextAlign.justify,
                Colors.red[900]),
            space(15),
            texto(descrip, 16, TextAlign.justify, Colors.black),
          ],
        ),
      ),
    );
  }

  Widget imagen() {
    String url =
        "https://static.wikia.nocookie.net/4071d8a0-051b-488d-abc7-2ec765f0b9a8";
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            texto("Imagen del Reporte", 20, TextAlign.justify, Colors.red[900]),
            space(20),
            Image.network(url),
          ],
        ),
      ),
    );
  }
}
