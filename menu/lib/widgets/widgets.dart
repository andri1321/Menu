// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreeState createState() => _LoginScreeState();
}

class _LoginScreeState extends State<LoginScreen> {

  final String usuarioValido = 'Admin';
  final String contrasenaValida = 'admin1';

  TextEditingController usuarioController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    final _mediaQuery = MediaQuery.of(context).size;

    return Stack(
        children: [
          BackgroundContainer(
           mediaQuery: _mediaQuery,
         ),
          Center(
           child: BLogin(),
          ), 
        ],
    );
  }
  
  void _verificarCredenciales() {
    String usuarioIngresado = usuarioController.text;
    String contrasenaIngresada = contrasenaController.text;

    if (usuarioIngresado == usuarioValido && contrasenaIngresada == contrasenaValida) {
      context.go('/login/home');
    } else {
      _mostrarMensaje('Credenciales incorrectas. Por favor, inténtalo de nuevo.');
    }
  }
  
  void _mostrarMensaje(String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mensaje'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
              Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key,
    required Size mediaQuery,
  }) : _mediaQuery = mediaQuery;

  final Size _mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _mediaQuery.height * 0.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(177, 167, 104, 82),
            Color.fromARGB(253, 45, 90, 167)
          ]),
         borderRadius: BorderRadius.only(
         bottomRight: Radius.circular(30),
        ),
      ),
    );
  }
}


class BLogin extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
     width: 270,
     height: 350,
     decoration: BoxDecoration(
      color: const Color.fromARGB(255, 111, 54, 244),
      borderRadius:const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        topRight: Radius.circular(40)
      ),
      border: Border.all(width: 1, color: Colors.blueGrey)
     ),    
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          child: Column(
            children: [
               const Text('LOGIN', style: TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.bold,
               shadows: [Shadow(
                   color: Color.fromARGB(220, 0, 0, 0),
                   offset: Offset(1, 1),
                   blurRadius: 15,
                  )]
                )
               ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                  child: Column(
                    children: [
                      Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      ),
                      child: TextFormField(
                      decoration: InputDecoration(border: InputBorder.none, labelText: 'Username'),
                    ),
                   ),
                  const SizedBox( height: 5),
                   Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                    ),
                    child: TextFormField(
                    decoration: InputDecoration(border: InputBorder.none, labelText: 'password'),
                     ),
                    ),
                  const SizedBox( height: 25),
                   ElevatedButton(
                  child: const Text('Iniciar sesion'),
                  onPressed: (){}, 
                  )
                  ],
                ),
              )
            ],
          )
        )
      ],
     ),
    );
  }
}

