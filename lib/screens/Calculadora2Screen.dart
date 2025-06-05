import 'package:app_09/navigation/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calculadora2 extends StatefulWidget {
  const Calculadora2({super.key});

  @override
  State<Calculadora2> createState() => _Calculadora2State();
}

class _Calculadora2State extends State<Calculadora2> {
  TextEditingController _capital = TextEditingController();
  TextEditingController _tasa = TextEditingController();
  TextEditingController _tiempo = TextEditingController();

  double? _capitalValor;
  double? _interes;
  double? _montoFinal;

  final _formatoMoneda = NumberFormat.simpleCurrency(locale: 'en_US');

  void _calcular() {
    final capital = double.tryParse(_capital.text);
    final tasa = double.tryParse(_tasa.text);
    final tiempo = double.tryParse(_tiempo.text);

    if (capital == null || capital <= 0) {
      _mostrarError("Ingresa un capital inicial válido y positivo");
      return;
    }
    if (tasa == null || tasa <= 0) {
      _mostrarError("Ingresa una tasa de interés válida y positiva");
      return;
    }
    if (tiempo == null || tiempo <= 0) {
      _mostrarError("Ingresa un tiempo válido y positivo");
      return;
    }

    final interes = capital * (tasa * tiempo) / 100;
    final montoFinal = capital + interes;

    setState(() {
      _capitalValor = capital;
      _interes = interes;
      _montoFinal = montoFinal;
    });
  }

  void _limpiar() {
    _capital.clear();
    _tasa.clear();
    _tiempo.clear();
    setState(() {
      _capitalValor = null;
      _interes = null;
      _montoFinal = null;
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
      appBar: AppBar(title: const Text("")),
      drawer: MiDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Calculadora de interés simple",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _capital,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Capital inicial"),
              ),
              TextField(
                controller: _tasa,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: "Tasa de interés anual (%)"),
              ),
              TextField(
                controller: _tiempo,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Tiempo (años)"),
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
              if (_capitalValor != null && _interes != null && _montoFinal != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Capital inicial: ${_formatoMoneda.format(_capitalValor)}"),
                    Text("Interés generado: ${_formatoMoneda.format(_interes)}"),
                    Text("Monto final: ${_formatoMoneda.format(_montoFinal)}"),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
