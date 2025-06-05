import 'package:app_09/screens/Calculadora1Screen.dart';
import 'package:app_09/screens/Calculadora2Screen.dart';
import 'package:app_09/screens/SimuladorScreen.dart';
import 'package:flutter/material.dart';

void main() {
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
      appBar: AppBar(
        title: Text("Ejercicios Flutter - EJERCICIOS 04"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://png.pngtree.com/png-clipart/20250107/original/pngtree-calculator-png-image_4962388.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Capa oscura semi-transparente para contraste
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Texto central
          Center(
            child: Text(
              '¡Bienvenido a los Ejercicios!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
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
      )
    );
    
  }
}
