import 'package:flutter/material.dart';

import 'package:mailbox_movil/screens/login/login.dart';
import 'package:mailbox_movil/screens/login/Registrar.dart';
import 'package:mailbox_movil/screens/news/noticias.dart';
import 'package:mailbox_movil/screens/perfil/perfil.dart';
import 'package:mailbox_movil/services/auth_Service.dart';
import 'package:mailbox_movil/screens/principal.dart';
import 'package:provider/provider.dart';
import 'package:mailbox_movil/screens/reportes/form_reporte.dart';

void main() => runApp(MyAPP());

class MyAPP extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers:[
       ChangeNotifierProvider(
         create: (_)=> AuthService()
       
       ) ,

    ],
    child: MaterialApp(
      theme: ThemeData(pageTransitionsTheme: PageTransitionsTheme(builders: {
     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
     })),
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      // Inicie la aplicación con la ruta con nombre. En nuestro caso, la aplicación comenzará
      // en el Widget FirstScreen
      initialRoute: '/', 
      routes: {
        // Cuando naveguemos hacia la ruta "/", crearemos el Widget FirstScreen
        //simular una pantalla de carga llamarla en lugar de login
        '/': (context) => loginPage(),
        // Cuando naveguemos hacia la ruta "/second", crearemos el Widget SecondScreen
        '/registrar': (context) => Registrar(),
        '/principal': (context) => principal(),
        '/comentarios': (context) => comentario(),
        '/formReporte' : (context) => FormReport(),
      },
    ),
  );
  }
}