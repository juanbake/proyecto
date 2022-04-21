import 'package:flutter/material.dart';
import 'package:mailbox_movil/colores.dart';
import 'package:mailbox_movil/providers/principalProvider.dart';
import 'package:mailbox_movil/screens/news/noticias.dart';
import 'package:mailbox_movil/screens/perfil/perfil.dart';
import 'package:mailbox_movil/screens/reportes/list_reporte.dart';
import 'package:provider/provider.dart';

class principal extends StatelessWidget {
  const principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> principalProvider(),
      child:principal1());
  }
}

class principal1 extends StatelessWidget {
 
int x= 0;
  @override
  Widget build(BuildContext context) {
      final menuDatos = Provider.of<principalProvider>(context);
    return  SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: barraSuperior()),
       body: menuDatos.currentIndex == 0? perfil():menuDatos.currentIndex == 1? noticias():ListReport(),
        
          floatingActionButton: 
             FloatingActionButton(backgroundColor: colores().principal,
        
            onPressed: (){ Navigator.pushReplacementNamed(
                                      context, '/formReporte');},
      child: Icon(Icons.ballot_rounded),
      ),
          
      floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
      
      bottomNavigationBar: menu()
      
        ),
      
    );
  }
}

class menu extends StatelessWidget {
       
  const menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final menuDatos = Provider.of<principalProvider>(context);
  
    return BottomAppBar(
    
      notchMargin: 4,
      elevation:10,
       clipBehavior:Clip.antiAliasWithSaveLayer,
       shape: CircularNotchedRectangle(),
      child: BottomNavigationBar(
      selectedItemColor:colores().principal,
    
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.person), label:'perfil'
      ),  BottomNavigationBarItem(icon: Icon(Icons.newspaper), label:'noticias'
      ),
      BottomNavigationBarItem(icon: Icon(Icons.pageview), label:'reportes'),
       
      ],
      currentIndex: menuDatos.currentIndex,
  onTap: (val){
menuDatos.setcurrentIndex(val);

  },
      
      
      
      ),);
  }
}

class barraSuperior extends StatelessWidget {
  const barraSuperior({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return     AppBar(
    
      
    
      elevation:10,
    
          backgroundColor: colores().principal,
    
          automaticallyImplyLeading: false,
    
          title: const Text(
    
           "Mailbox"
    
          ),
    
          actions: [
    
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: IconButton(
              icon: const Icon(Icons.logout_outlined),
              tooltip: 'Show Snackbar',
              onPressed: () {
            /*    ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));*/
                       Navigator.pushReplacementNamed(
                                      context, '/');
              },
            ),
         ),
          ],
    
          centerTitle: false,
    
         
    
        );
  }



}

