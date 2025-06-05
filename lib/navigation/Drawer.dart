import 'package:app_09/main.dart';
import 'package:app_09/screens/Calculadora1Screen.dart';
import 'package:app_09/screens/Calculadora2Screen.dart';
import 'package:app_09/screens/SimuladorScreen.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer( child: ListView
        
        (children: [
          DrawerHeader(child: Column(
            children: [
              Text("Titulo"),
              Expanded(child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjMHkPy3YKiM41zbLgbryX7ceYA4KlAfvZ1Q&s"))
            ],
          )),
          

          // PANTALLA 1 ---------------------------------------------------------------------------------------------------
          ListTile(
            title:Row(
              children: [
                Icon(Icons.calculate),
              Text("Calculadora 1"),
              ],
            ) ,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Calculadora1())),
          ),
          // PANTALLA 2 ---------------------------------------------------------------------------------------------------------
          ListTile(
            title:Row(
              children: [
                Icon(Icons.functions),
              Text("Calculadora 2"),
              ],
            ) ,
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=> Calculadora2())),
          ),

//PANTALLA 3 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
          ListTile(
            title:Row(
              children: [
                Icon(Icons.savings),
                Text("Simulador"),
              ],
            ),
            onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=> Simulador())),
          ),


// PANTALLA HOME ----------------------------------------------------------------------------------------------------------------------------------------------

          ListTile(
            title:Row(
              children: [
                Icon(Icons.home),
                 Text("Home"),
              ],
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Ejercicios04())),
          )
        ],),
      );
    
  }
}
