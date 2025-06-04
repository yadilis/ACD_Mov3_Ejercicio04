import 'package:app_09/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Calculadora2 extends StatelessWidget {
  const Calculadora2({super.key});

  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      body: Center(child: Text("Calculadora de interés simple"),),
     appBar: AppBar(),
     drawer: MiDrawer(),

    );
  }
}