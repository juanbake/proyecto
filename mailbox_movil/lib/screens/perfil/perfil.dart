import 'package:flutter/material.dart';
import 'package:mailbox_movil/models/modelUsuario.dart';
import 'package:mailbox_movil/screens/barraSuperior.dart';
import 'package:mailbox_movil/screens/principal.dart';
import 'package:mailbox_movil/services/auth_Service.dart';
import 'package:mailbox_movil/services/perfilSevice.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types

class perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final authService =Provider.of<AuthService>(context, listen: false); 
    //Text(authService.token)
  return  ChangeNotifierProvider(
    create: (_)=> perfilService(authService.token),
    child: body());
      
}
}

 class body extends StatelessWidget{
  



  @override
  Widget build(BuildContext context) {
    final infoUsuario = Provider.of<perfilService>(context).usuario;
   final authService =Provider.of<AuthService>(context, listen: false); 
   authService.setid(  infoUsuario.isEmpty?" " :infoUsuario[0].id);
double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
  
    return SingleChildScrollView(
          child: Stack(
            
            children: <Widget>[
                 SizedBox(height: height*0.8),
              Positioned(

                
                child: Image.asset(
                    "assets/images/parallax-uni.jpg"),
              ),
              Positioned(
                top: height*0.23,
                left: width*0.12,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: width*0.65,
                      child: Column(
                        
                        children: <Widget>[
                          SizedBox(height: 50),
                          Text(
                        
                                     infoUsuario.isEmpty?" " :infoUsuario[0].name+ " " +infoUsuario[0].surname,
                        style: TextStyle(
                            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                         
                          SizedBox(height: 40),
                      campo( infoUsuario.isEmpty?" " :infoUsuario[0].career, Icons.work),
                         SizedBox(height: 40),
                        
                 campo( infoUsuario.isEmpty?" " :infoUsuario[0].email, Icons.email),
                                
                         SizedBox(height: 40),
                       
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                 top: height*0.17,
                left: width*0.35,
                child: Container(
                  width:100.0,
                  height:100.0,
                  decoration: new BoxDecoration(
                   boxShadow: [
            new BoxShadow(
              spreadRadius: 4,
            color: Color.fromARGB(255, 255, 255, 255),
              offset: new Offset(0.0, 0.0),
              blurRadius: 0,
        ),
         ],
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: new AssetImage(
                 "assets/images/perfil.jpeg",
                      )
                    )
                  )
                ),
              )
           
           
            ],
          ));
  }
}







Widget campo(infoUsuario, x) {
  
  return    TextFormField(
                       enabled:false,
                        
                          decoration: InputDecoration(
                            
                            labelText:  infoUsuario.isEmpty?" " :infoUsuario,
                            prefixIcon: Icon(x),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
}

