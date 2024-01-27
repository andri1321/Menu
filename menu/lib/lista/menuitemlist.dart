import 'package:flutter/material.dart';
import 'package:menu/lista/menuitem.dart';

List<MenuItem> itemlist = [
          MenuItem(
              texto: 'Contador', 
              icon: const  Icon(Icons.numbers, size: 115, color: Color.fromARGB(255, 179, 255, 0),), 
              path: '/login/home/contador', 
              ),
              
              MenuItem(
              //  ontap: () => {
              //   path: '/',
              //  },
              texto: 'Loteria',
              icon: const Icon(Icons.pin, size: 115, color: Color.fromARGB(255, 255, 0, 0),),
              path: '/login/home/loteria',
                ),
            
];
