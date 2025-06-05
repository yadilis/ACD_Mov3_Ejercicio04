import 'package:flutter/material.dart';
import 'package:app_09/navigation/Drawer.dart';
import 'package:intl/intl.dart';

class Calculadora1 extends StatefulWidget {
  const Calculadora1({super.key});

  @override
  State<Calculadora1> createState() => _Calculadora1State();
}

class _Calculadora1State extends State<Calculadora1> {
  final TextEditingController _montoController = TextEditingController();
  final TextEditingController _personalizadoController = TextEditingController();

  double? _propina;
  double? _total;
  int _porcentaje = 10;
  bool _usarPersonalizado = false;

  final _formatoMoneda = NumberFormat.simpleCurrency(locale: 'es_EC');

  void _calcularPropina() {
    final monto = double.tryParse(_montoController.text);

    if (monto == null || monto <= 0) {
      _mostrarError("Ingresa un monto válido y positivo");
      return;
    }

    double porcentaje = _usarPersonalizado
        ? double.tryParse(_personalizadoController.text) ?? 0
        : _porcentaje.toDouble();

    if (porcentaje <= 0) {
      _mostrarError("Porcentaje no válido");
      return;
    }

    final propina = monto * (porcentaje / 100);
    final total = monto + propina;

    setState(() {
      _propina = propina;
      _total = total;
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
      appBar: AppBar(title: const Text("Calculadora de Propinas")),
      drawer: MiDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Calculadora para restaurante",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Monto de la cuenta"),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text("Porcentaje de propina: "),
                DropdownButton<int>(
                  value: _usarPersonalizado ? null : _porcentaje,
                  items: [10, 15, 20]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text("$e%"),
                          ))
                      .toList(),
                  hint: const Text("Seleccionar"),
                  onChanged: _usarPersonalizado
                      ? null
                      : (valor) {
                          setState(() {
                            _porcentaje = valor ?? 10;
                          });
                        },
                ),
                const SizedBox(width: 10),
                Checkbox(
                  value: _usarPersonalizado,
                  onChanged: (valor) {
                    setState(() {
                      _usarPersonalizado = valor ?? false;
                    });
                  },
                ),
                const Text("Personalizado")
              ],
            ),
            if (_usarPersonalizado)
              TextField(
                controller: _personalizadoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Porcentaje personalizado"),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcularPropina,
              child: const Text("Calcular"),
            ),
            const SizedBox(height: 16),
            if (_propina != null && _total != null)
              Column(
                children: [
                  Text("Propina: ${_formatoMoneda.format(_propina)}"),
                  Text("Total a pagar: ${_formatoMoneda.format(_total)}"),
                ],
              )
          ],
        ),
      ),
    );
  }
}
