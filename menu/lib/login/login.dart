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

    return Scaffold(
      backgroundColor: Color.fromARGB(197, 109, 68, 14),
     body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: _mediaQuery.height * 0.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(177, 167, 104, 82),
                Color.fromARGB(253, 45, 90, 167)
              ]
              ),
             borderRadius: BorderRadius.only(
             bottomRight: Radius.circular(30),
            ),
          ),
        ),

        Center(
          child: Container(
           width: 250,
           height: 350,
           decoration: BoxDecoration(
            color: Color.fromARGB(150, 111, 54, 244),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(40)
            ),
            border: Border.all(width: 1, color: Colors.blueGrey)
           ),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Text('LOGIN', style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          shadows: [ 
            Shadow(
              color: Color.fromARGB(220, 0, 0, 0),
              offset: Offset(1, 1),
              blurRadius: 15,
            ),
            ]
          )),

        Padding(
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de texto para el nombre de usuario
            TextField(
              controller: usuarioController,
              decoration: InputDecoration(labelText: 'Usuario', labelStyle: TextStyle(color: Color.fromARGB(206, 0, 0, 0))),
            ),
            SizedBox(height: 5),
            // Campo de texto para la contraseña
            TextField(
              controller: contrasenaController,
              obscureText: true, // Para ocultar la contraseña
              decoration: InputDecoration(labelText: 'Contraseña', labelStyle: TextStyle(color: Color.fromARGB(206, 0, 0, 0))),
            ),
            SizedBox(height: 25),
            // Botón de inicio de sesión
            ElevatedButton(
              onPressed: () {
                // Llamar a la función de verificación de credenciales
                _verificarCredenciales();
              },
              child: Text('Iniciar sesión'),
            ),
          ],
        ),
      ),

              
            ],
          ),

         )
        )

      ],
     )
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