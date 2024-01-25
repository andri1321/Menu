import 'package:flutter/material.dart';
import 'package:menu/lista/menuitem.dart';

List<MenuItem> itemlist = [
          MenuItem(
              texto: 'Contador', 
              icon: const  Icon(Icons.numbers, size: 115, color: Color.fromARGB(255, 179, 255, 0),), 
              path: '/home/contador', 
              ),
              
              MenuItem(
              //  ontap: () => {
              //   path: '/',
              //  },
              texto: 'Loteria',
              icon: const Icon(Icons.pin, size: 115, color: Color.fromARGB(255, 255, 0, 0),),
              path: '/home/loteria',
                ),
              MenuItem(
              //  ontap: () => {
              //   path: '/',
              //  },
              texto: ('Contador'),
              icon: const Icon(Icons.change_history_rounded, size: 115, color: Color.fromARGB(255, 255, 72, 0),),
              path: 'pantalla',
              ),
];
