import 'package:flutter/material.dart';
import 'package:mailbox_movil/screens/reportes/info_reporte.dart';
import 'package:mailbox_movil/colores.dart';
import 'package:mailbox_movil/services/auth_Service.dart';
import 'package:mailbox_movil/services/listaReportesService.dart';
import 'package:mailbox_movil/services/perfilSevice.dart';
import 'package:provider/provider.dart';




class ListReport extends StatefulWidget {
  const ListReport({Key? key}) : super(key: key);

  @override
  State<ListReport> createState() => _ListReport();
}

class _ListReport extends State<ListReport> {
  @override
  Widget build(BuildContext context) {
    
     final authService =Provider.of<AuthService>(context, listen: false); 
    return ChangeNotifierProvider(create: (_)=> listReporte(authService.token, authService.idUsuario),
      child: cuerpo());
   
       
    
  
  }
  }

  Widget cuerpo() {
    return 
    
       reportButtom();
        
      
    
  }

 
  Widget welcome() {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              texto("Buzón de Reportes ", 25, TextAlign.left, colores().principal),
              
              texto("En esta seccion podrás ver el seguimiento de tus reportes.",
                  15, TextAlign.justify, Colors.black)
            ],
          ),
        ),
      ),
    );
  }

  Widget texto(String text, double? num, TextAlign ali, Color? col) {
    return Column(children: [
      Text(text,
      
          textAlign: ali,
          style: TextStyle(
            color: col,
            fontSize: num,
            fontWeight: FontWeight.bold,
          )),
    ]);
  }

 

class reportButtom extends StatelessWidget {
  const reportButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final REPORTE = Provider.of<listReporte>(context).listaReporte;
    return Scaffold(
      body: Builder(
        builder: (context){
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,

          itemCount: REPORTE.length,
          itemBuilder: (BuildContext context, int index){
return  Card(

  child:   Container(
   height: 80,
   
           child:  Row(
  
                  children: [
  
                    icono(Colors.blue, 40),
  
                    space2(10),
  
                    Container(
 width: 159,
                      child: Align(
  
                        alignment: Alignment.bottomLeft,
  
                        child: Column(
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
              texto("Reporte "+index.toString(),18, TextAlign.left, Colors.black),
  
              space(5),
  
              
              texto(REPORTE[index].description, 10, TextAlign.left, Colors.black),
  
            ],
  
          )
  
                      ),
  
                    ),
  
                   Container(
                     width: 110,
                     child: Column(
                     
                               children: [
                     
                                 texto("Por revisar", 18, TextAlign.left, Colors.red),
                     
                                 space(5),
                     
                                 texto("20 de abril", 15, TextAlign.left, Colors.black),
                     
                               ],
                     
                             ),
                   ),
  
                  ],
  
                ),
  
             
  
            
  
          ),
);
  




          }

          );

        }

      )

    );
 
        }


  Widget space2(double? num) {
    return SizedBox(width: num);
  }

  Widget space(double? num) {
    return SizedBox(height: num);
  }


  Widget icono(Color co, double? num) {
    return Icon(
      Icons.miscellaneous_services_outlined,
      color: co,
      size: num,
    );
  }

}