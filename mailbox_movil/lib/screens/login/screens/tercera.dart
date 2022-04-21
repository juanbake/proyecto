import 'package:flutter/material.dart';

class tercera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tercera'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // Navega a la segunda pantalla cuando la pulsen!
          },
        ),
      ),
    );
  }
}
