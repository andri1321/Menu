import 'package:go_router/go_router.dart';
import 'package:menu/Screens/contador.dart';
import 'package:menu/Screens/loteria.dart';
import 'package:menu/home_screen.dart';
import 'package:menu/login/login.dart';


final GoRouter router = GoRouter(
  
  initialLocation: '/login',
  
  routes: [
      
      GoRoute( path: '/login', builder: (context, state) => Login(),
      routes: [
        GoRoute(path: 'home',     builder: (context, state) => HomeScreen(),
     routes: [
       GoRoute( path: 'loteria', builder: (context, state) => const Loteria()),
       GoRoute( path: 'contador', builder: (context, state) => const Contador()),
     ]),
      ]
      ),  


     
       
     
     
  ]
);