// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Login extends StatefulWidget {
   
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final String usuarioValido = 'Admin';
  final String contrasenaValida = 'admin1';

  TextEditingController usuarioController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
    body: Stack(
       children: [
        Fondo(
          child: Center(
          child:  DesignLogin(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Form(
        key: _formKey,
          child: Column(
            children: [
               TitleLogin(),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                  child: Column(
                    children: [
                      
                      ButtonTextFormFiel(
                        child: TextFF(
                          controller: usuarioController,
                          labelText: 'User', 
                          obscureText: false,
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu nombre de usuario';
                          }
                          return null; // La validación pasó
                          },
                          ),
                      ),

                     const SizedBox( height: 15),

                     ButtonTextFormFiel(
                        child: TextFF(
                          controller: contrasenaController,
                          labelText: 'Password', 
                          obscureText: true,
                         validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Por favor, ingresa tu nombre de usuario';
                         }
                           // La validación pasó
                         },
                          )
                      ),

                   const SizedBox( height: 25),

                    Buttonsend(
                      onPressed: (){
                     if (_formKey.currentState?.validate() ?? false) {
                    context.go('/login/home');
                  }
                  }
                    ),

                  ],
                ),
              )
            ],
          )
        )
    ]
    )
      ),
        )
          )
        
       ],
     )
    );
  }
}

//   void _verificarCredenciales() {
//     String usuarioValido = usuarioController.text;
//     String contrasenaValida = contrasenaController.text;

//     if (usuarioController == usuarioValido && contrasenaValida == contrasenaValida) {
//       context.go('/login/home');
//     } else {
//       _mostrarMensaje('Credenciales incorrectas. Por favor, inténtalo de nuevo.');
//     }
//   }

// void _mostrarMensaje(String mensaje) {
//     showDialog(
//     context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Mensaje'),
//           content: Text(mensaje),
//           actions: [
//             TextButton(
//               onPressed: () {
//               Navigator.of(context).pop();
//               },
//               child: const Text('Aceptar'),
//             ),
//           ],
//         );
//       },
//     );
//   }








class Fondo extends StatelessWidget {
const Fondo({
    super.key, 
    required this.child
    }); 
   final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
       gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromARGB(255, 35, 12, 97),
          Color.fromARGB(255, 22, 129, 218),
        ]
        )
      ),
      child: child,
    );
  }
}

class DesignLogin extends StatelessWidget {
  const DesignLogin({
    super.key, 
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
         width: 270,
         height: 350,
         decoration: BoxDecoration(
          boxShadow: const  [
            BoxShadow(
              blurRadius: 50
            )
          ],
    image: const DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage('https://i.pinimg.com/564x/b0/c2/54/b0c25404108de52f1384a26c211eb9ab.jpg') 
      ),
    borderRadius:const BorderRadius.only(
      bottomLeft: Radius.circular(40),
      topRight: Radius.circular(40)
    ),
    border: Border.all(width: 1, color: Colors.blueGrey)
      ),
      child: child, 
    );
  }
}

class TitleLogin extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  const Text('LOGIN', style:  TextStyle(
                color: Color.fromARGB(193, 0, 0, 0),
               fontSize: 25,
               fontWeight: FontWeight.bold,
               shadows: [Shadow(
                   color: Color.fromARGB(220, 10, 117, 10),
                   offset: Offset(1, 1),
                   blurRadius: 40,
                  )]
                )
    );
  }
}

class ButtonTextFormFiel extends StatelessWidget {
  final Widget child;

  const ButtonTextFormFiel({
    super.key, 
    required this.child
    });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
      ),
      child: child,
    );
  }
}

class TextFF extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;

  const TextFF({super.key,
  required this.obscureText, 
  required this.labelText, 
  required this.controller, 
  required String? Function(dynamic value) validator
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none, 
        labelText: labelText
      ),
    );
  }
}

class Buttonsend extends StatelessWidget {
  final Function() onPressed;

  const Buttonsend({super.key, 
  required this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                   style: TextButton.styleFrom(
                    side: const BorderSide(
                      width: 1,
                      color: Color.fromARGB(111, 19, 18, 18)
                    ),
                    shadowColor: Colors.amber,
                    backgroundColor: Color.fromARGB(143, 0, 0, 0)
                  ),
                  child: const Text('Iniciar sesion', style: TextStyle( color: Color.fromARGB(255, 255, 255, 255)),),
                  onPressed: onPressed,
                  
                  );
  }
}

