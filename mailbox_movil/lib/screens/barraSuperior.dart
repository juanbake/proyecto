import 'package:flutter/material.dart';


class barraSuperior extends StatelessWidget {
   barraSuperior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF795548),
      automaticallyImplyLeading: false,
      title: const Text(
        'Comentarios',
      ),
      actions: [
     
      ],
      centerTitle: false,
      elevation: 2,
    );
 
  }
}