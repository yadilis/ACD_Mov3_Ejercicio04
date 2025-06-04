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
              Expanded(child: Image.network("https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?auto=compress&cs=tinysrgb&w=600"))
            ],
          )),
          

          // PANTALLA 1 ---------------------------------------------------------------------------------------------------
          ListTile(
            title:Row(
              children: [
                Icon(Icons.filter_1),
              Text("Calculadora 1"),
              ],
            ) ,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Calculadora1())),
          ),
          // PANTALLA 2 ---------------------------------------------------------------------------------------------------------
          ListTile(
            title:Row(
              children: [
                Icon(Icons.filter_2),
              Text("Calculadora 2"),
              ],
            ) ,
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=> Calculadora2())),
          ),

//PANTALLA 3 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
          ListTile(
            title:Row(
              children: [
                Icon(Icons.filter_3_outlined),
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
