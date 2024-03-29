
// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu/lista/menuitemlist.dart';

 class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _mediaQuery = MediaQuery.of(context).size;
    final int crossAxisCount = _mediaQuery.width > 600 ? 10 : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        elevation: 80,
       
        ),
      body: CuerpoB(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: GridView.builder(
              itemCount: itemlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0,
                crossAxisCount: crossAxisCount
                ), 
              itemBuilder:(context, index) {
                return GestureButtom(
                  
                  text: itemlist[index].texto,
                  icon: itemlist[index].icon, 
                  path: itemlist[index].path,
                  
                 );
              },
              ),
          ),
        ),
      )
    );
  }
}

class CuerpoB extends StatelessWidget {
  const CuerpoB({
    super.key, 
    required this.child, 
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
      color: Color.fromRGBO(255, 230, 230, 1)
    ),
    child: child
    );
  }
}

class GestureButtom extends StatelessWidget {
  
  final Color? containerColor;
  final double? containerWidth;
  final double? containerHeight;
  final String text;
  final Icon icon;
  final Decoration? decoration;
  final Function()? ontap;
  final String path;

  const GestureButtom({
    super.key, 
    this.containerColor, 
    this.containerWidth, 
    this.containerHeight, 
    required this.text, 
    required this.icon, 
    this.decoration, 
     this.ontap, 
     required this.path, 
     
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        context.go( path );
      },
      child: Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
           border: Border.all(width: 1)
           ),
        child: Center(
          child: Column(
            children: [
              icon,
              Text( text, style: const TextStyle( fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
            ]    
          ),
        ),
      ),
    );
  }
}




