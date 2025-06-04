import 'package:app_09/screens/Calculadora1Screen.dart';
import 'package:app_09/screens/Calculadora2Screen.dart';
import 'package:app_09/screens/SimuladorScreen.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(Ejercicios04());
}

class Ejercicios04 extends StatelessWidget {
  const Ejercicios04({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicios Flutter - EJERCICIOS 04"),centerTitle:true ,),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/imagenes/fondo.jpg"),
          fit: BoxFit.cover)
        ),
        child: Center(
          child: Column(children: [
          
          ],),
        ),
      ),

        drawer:Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Calculadora 1"),
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>Calculadora1())),
              ),
              
  //////////////////////// PANTALLA 2 /////////////////////////
        ListTile(
          title: Text("Calculadora 2"),
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=>Calculadora2())),
        ),

  // ----------------------------- PANTALLA 3 -----------------------
          ListTile(
            title: Text("Simulador"),
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder:(context)=>Simulador())),
          )          
            ],
          ),
        ),
    );
    
    
  }
}