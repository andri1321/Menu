// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:menu/widgets/widgets.dart';

class Login extends StatelessWidget {
   
  const Login({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(197, 109, 68, 14),
      
      body: LoginScreen()
    );
  }
}


