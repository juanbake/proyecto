import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailbox_movil/colores.dart';
import 'package:mailbox_movil/providers/loginFromProvider.dart';
import 'package:mailbox_movil/services/auth_Service.dart';
import 'package:provider/provider.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
          create: (_) => LoginFromProvider(), child: _loginPage()),
    );
  }
}

class _loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFromProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
            child: Container(
      color: Colors.white,
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height * 0.3,
              child: Image.asset(
                'assets/images/Mail2.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: width * 0.8,
              child: Form(
                key: loginForm.formKey,
                child: Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Iniciar sesion',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          onChanged: (value) => loginForm.email = value,
                          validator: (value) {
                            String patron = r"^[0-9]";
                            RegExp regExp = RegExp(patron);
                            return (regExp.hasMatch(value ?? ''))
                                ? null
                                : 'la matricula tiene que ser numerica';
                          },
                          decoration: InputDecoration(
                            labelText: 'Matricula',
                            suffixIcon: Icon(Icons.numbers),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          onChanged: (value) => loginForm.password = value,
                          validator: (value) {
                            return (value != null && value.length >= 6)
                                ? null
                                : 'ingresa una contraseña valida';
                          },
                          obscureText: loginForm.vercampoContra,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            
                            suffixIcon:IconButton(
                onPressed: () {
              
                    loginForm.campoContra();
                  
                },
                icon: Icon(Icons.visibility_off)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                disabledColor: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      loginForm.simular? 'Cargando': 'Ingresar',
                                      style:
                                          TextStyle(color: colores().blanco)),
                                ),
                                color: colores().principal,
                                onPressed: () async {
                                  loginForm.simularCarga();
                                  Future.delayed(Duration(seconds: 4), () {
    loginForm.simularCarga();
});
                                
                                  if (!loginForm.isValidFrom()) {
                                    return;
                                  }
                                  loginForm.isLoading = true;
                                  final authService =Provider.of<AuthService>(context, listen: false);
                                  bool? error = await authService.login(loginForm.email, loginForm.password);
                                  if(error) {
                                    print(authService.getToken());
                                     Navigator.pushReplacementNamed(
                                      context, '/principal');
                                      }else{
                                        loginForm.isLoading = false;
                                       
                                     
                                        showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error al iniciar sesion'),
          content: const Text('Usuario o contraseña incorrectos'),
          actions: <Widget>[
           
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ));
                                        }

                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/registrar');
              },
              child: Text.rich(
                TextSpan(text: 'No tienes una cuenta? ', children: [
                  TextSpan(
                    text: 'Registrate',
                    style: TextStyle(color: Color(0xffEE7B23)),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
