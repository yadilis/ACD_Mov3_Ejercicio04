import 'package:app_09/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Calculadora1 extends StatelessWidget {
  const Calculadora1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text("Calculadora para restaurante"),),
     appBar: AppBar(),
     drawer: MiDrawer(),

    );
  }
}