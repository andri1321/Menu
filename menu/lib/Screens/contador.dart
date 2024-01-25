import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  static const name = 'contador';

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text('Contador', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo,
      ),

      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 213, 220, 221),
       
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text('Vamos a Contar', style: TextStyle( fontSize: 20),),
           
           const SizedBox( height: 2,),

           Text('$counter', style: const TextStyle(fontSize: 20),),

           const SizedBox( height: 50,),
            
            Center(
               child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                         decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:  TextButton(
                          onPressed: (){

                           setState(() {
                             
                           });
                            counter ++;

                          }, 
                          child: const Icon(Icons.add, color: Colors.white,)
                          ),
                      ),
                  
                       const SizedBox( width: 5,),
                  
                       Container(
                        width: 50,
                        height: 50,
                         decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:  TextButton(
                          onPressed: (){

                          setState(() {
                             
                           });
                            counter = 0;

                          }, 
                          child: const Icon(Icons.restart_alt, color: Colors.white,)
                          ),
                      ),
                  
                      const SizedBox( width: 5,),
                  
                       Container(
                        width: 50,
                        height: 50,
                        
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:  TextButton(
                          onPressed: (){

                           setState(() {
                             
                           });
                            counter --;

                          }, 
                          child: const Icon(Icons.remove, color: Colors.white,)
                          ),
                      ),
                   ],
                  ),
           ) 
          ],
        )
       ),
    );
  }
}