/*import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailbox_movil/colores.dart';
import 'package:mailbox_movil/screens/barraSuperior.dart';
import 'package:mailbox_movil/services/auth_Service.dart';
import 'package:mailbox_movil/services/comentariosService.dart';
import 'package:mailbox_movil/services/noticiasService.dart';
import 'package:provider/provider.dart';
//https://www.youtube.com/watch?v=2jAb1MRPbVc
//https://www.youtube.com/watch?v=kpjgTlyeZjU
//https://www.youtube.com/watch?v=2jAb1MRPbVc&t=140s

class noticias extends StatelessWidget {
  const noticias({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    
    final authService =Provider.of<AuthService>(context, listen: false); 
    return ChangeNotifierProvider(create: (_)=> noticiasService(authService.token),
      child: noticiasBody());
   
       
    
  
  }
}

String comentarioSelect ="";

class noticiasBody extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
      final noticiasData = Provider.of<noticiasService>(context).noticias;
      
    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
       body:  Builder(
         builder: (context) {
           return ListView.builder(
             scrollDirection: Axis.vertical,
           shrinkWrap: true,
             itemCount:noticiasData.length ,
             itemBuilder: (BuildContext context, int index){
            return  Card(
               clipBehavior: Clip.antiAliasWithSaveLayer,
              // color: FlutterFlowTheme.of(context).primaryBtnText,
               child: Padding(
                 padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 8),
                 child: Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                //     color: FlutterFlowTheme.of(context).primaryBtnText,
                   ),
                   child: Column(
                     mainAxisSize: MainAxisSize.max,
                     children: [
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         children: [
                           Container(
                             width: 60,
                             height: 60,
                             
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                             ),
                             child: Image.asset(
                               'assets/images/LOGO__UPQROO.jpeg',
                             ),
                           ),
                           Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 'Universidad Politecnica de \nQuintana Roo',
                                 textAlign: TextAlign.left,
                                 
                  /*                 style: FlutterFlowTheme.of(context)
                                     .bodyText1
                                     .override(
                                       fontFamily: 'Poppins',
                                       color: Color(0xFF48332B),
                                       lineHeight: 1.2,
                                     ),*/
                               ),
                               Row(
                                 mainAxisSize: MainAxisSize.max,
                                 mainAxisAlignment:
                                     MainAxisAlignment.start,
                                 children: [

                                   Icon(
                                     Icons.date_range_rounded,
                                     color: Color(0xFF959595),
                                     size: 18,
                                   ),
                                   Text(
                                     
                                     
                                     
                                      noticiasData[index].createdAt.day.toString()+" - "+
                                      noticiasData[index].createdAt.month.toString()+" - "+
                                      noticiasData[index].createdAt.year.toString()
                                     /*style: FlutterFlowTheme.of(context)
                                         .bodyText1
                                         .override(
                                           fontFamily: 'Poppins',
                                           color: Color(0xFF959595),
                                           fontSize: 11,
                                         ),*/
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ],
                       ),
                       Padding(
                         padding:
                             EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                         child: Text(
                          noticiasData[index].description,
                         /*  style: FlutterFlowTheme.of(context)
                               .bodyText1
                               .override(
                                 fontFamily: 'Poppins',
                                 fontSize: 11,
                                 fontWeight: FontWeight.normal,
                                 lineHeight: 1.2,
                               ),*/
                         ),
                       ),
                       Padding(
                         padding:
                             EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                         child: Image.asset(
                         //  noticiasData[index].image
                           "assets/images/parallax-uni.jpg"
                          // ,
                          ,
                           width: 430,
                           height: 160,
                           fit: BoxFit.cover,
                         ),
                       ),
                       Divider(
                         color: Color(0xFF959595),
                       ),
                       
                       Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment:
                             MainAxisAlignment.spaceBetween,
                         children: [

                     /*       IconButton(
            icon: const Icon(Icons.favorite_border),
            color: Color.fromARGB(255, 207, 16, 16),
            iconSize: 30,
            onPressed: () {},
          ),*/
                MaterialButton(
                  minWidth: 310,
                  textColor: colores().blanco,
                                disabledColor: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("comentarios")
                                  ),
                                   color: colores().principal,
                                onPressed: () {

                                  comentarioSelect = noticiasData[index].id.toString();
                                  print("aqui aando------");
                          print(comentarioSelect);
                                      Navigator.pushNamed(
                                      context, '/comentarios');

                                },

                                  ),
                        
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
             );
  });
         }
       ),
    );
  }
}

class comentario extends StatelessWidget {
  const comentario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final authService =Provider.of<AuthService>(context, listen: false); 

    return ChangeNotifierProvider(create: (_)=> comentarioService(authService.token,comentarioSelect),
      child: comentarios(),
   
       
    
    );
     
      
    
  }
}

class comentarios extends StatelessWidget {
  const comentarios({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
final comentarioData = Provider.of<comentarioService>(context);

       
final comentario =Provider.of<comentarioService>(context).comentario;




    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: barraSuperior()),
      body: Builder(
        builder: (context) {
          return ListView.builder(
             scrollDirection: Axis.vertical,
    shrinkWrap: true,
             itemCount:comentario.length ,
             itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  12, 12, 12, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                    MainAxisAlignment.start,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional
                              .fromSTEB(0, 0, 0, 12),
                          child: Row(
                            mainAxisSize:
                                MainAxisSize.max,
                            children: [
                             
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional
                                    .fromSTEB(
                                        0, 0, 12, 0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection:
                                  Axis.vertical,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsetsDirectional
                                          .fromSTEB(0,
                                              0, 0, 0),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      width:
                                          double.infinity,
                                      height: 100 ,
                                      decoration:
                                          BoxDecoration(
                                        color: Color(
                                            0xFFF4F4F4),
                                        borderRadius:
                                            BorderRadius
                                                .circular(
                                                    8),
                                      ),
                                      child: Padding(
                                        padding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(
                                                    12,
                                                    8,
                                                    12,
                                                    8),
                                        child: Row(
                                          mainAxisSize:
                                              MainAxisSize
                                                  .max,
                                          children: [
                                            Container(
                                              width: 32,
                                              height: 32,
                                              clipBehavior:
                                                  Clip.antiAlias,
                                              decoration:
                                                  BoxDecoration(
                                                shape: BoxShape
                                                    .circle,
                                              ),
                                              child: Image
                                                  .asset(
                                                'assets/images/perfil.jpeg',
                                              ),
                                            ),
                                            Expanded(
                                              child:
                                                  Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12,
                                                        0,
                                                        0,
                                                        0),
                                                child:
                                                    Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Estudiante "+  comentario[index].id.toString()
                                               /*       style: FlutterFlowTheme.of(context).subtitle2.override(
                                                            fontFamily: 'Lexend Deca',
                                                            color: Color(0xFF262D34),
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.normal,
                                                          ),*/
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                          0,
                                                         4,
                                                          0,
                                                          0),
                                                      child:
                                                          Text(
                                                        comentario[index].comment,
                                                  /*      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                              fontFamily: 'Lexend Deca',
                                                              color: Color(0xFF57636C),
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.normal,
                                                            ),*/
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
             
             }
          );
        }
      ),
    );
  }
}
