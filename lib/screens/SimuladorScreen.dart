import 'package:app_09/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Simulador extends StatelessWidget {
  const Simulador({super.key});

  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      body: Center(child: Text("Simulador de ahorro mensual"),),
     appBar: AppBar(),
     drawer: MiDrawer(),

    );
  }
}