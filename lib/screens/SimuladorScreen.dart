import 'package:app_09/navigation/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Simulador extends StatefulWidget {
  const Simulador({super.key});

  @override
  State<Simulador> createState() => _SimuladorState();
}

class _SimuladorState extends State<Simulador> {
  final _ahorroMensualController = TextEditingController();
  final _cantidadMesesController = TextEditingController();

  double? _ahorroMensual;
  int? _cantidadMeses;
  double? _ahorroTotal;
  List<String> _detalleMeses = [];

  final _formatoMoneda = NumberFormat.simpleCurrency(locale: 'en_US');

  void _calcular() {
    final ahorroMensual = double.tryParse(_ahorroMensualController.text);
    final cantidadMeses = int.tryParse(_cantidadMesesController.text);

    if (ahorroMensual == null || ahorroMensual <= 0) {
      _mostrarError("Ingresa un ahorro mensual válido y positivo");
      return;
    }
    if (cantidadMeses == null || cantidadMeses <= 0) {
      _mostrarError("Ingresa una cantidad de meses válida y positiva");
      return;
    }

    double total = ahorroMensual * cantidadMeses;
    List<String> detalles = [];
    for (int i = 1; i <= cantidadMeses; i++) {
      detalles.add(
        "Mes $i: ${_formatoMoneda.format(ahorroMensual * i)}"
      );
    }

    setState(() {
      _ahorroMensual = ahorroMensual;
      _cantidadMeses = cantidadMeses;
      _ahorroTotal = total;
      _detalleMeses = detalles;
    });
  }

  void _limpiar() {
    _ahorroMensualController.clear();
    _cantidadMesesController.clear();
    setState(() {
      _ahorroMensual = null;
      _cantidadMeses = null;
      _ahorroTotal = null;
      _detalleMeses = [];
    });
  }

  void _mostrarError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simulador de ahorro mensual")),
      drawer: MiDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _ahorroMensualController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Ahorro mensual",
                ),
              ),
              TextField(
                controller: _cantidadMesesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Cantidad de meses",
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _calcular,
                    child: const Text("Calcular"),
                  ),
                  ElevatedButton(
                    onPressed: _limpiar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text("Limpiar"),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (_ahorroTotal != null) ...[
                Text(
                  "Total ahorrado: ${_formatoMoneda.format(_ahorroTotal)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Detalle mes a mes:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _detalleMeses.length,
                  itemBuilder: (context, index) {
                    return Text(_detalleMeses[index]);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
