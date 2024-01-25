import 'package:flutter/material.dart';

class MenuItem {

  MenuItem(  
    {
    required this.path,
    required this.texto,
    required this.icon,
    }
  );
  final String path;
  final String texto;
  final Icon icon;
}

