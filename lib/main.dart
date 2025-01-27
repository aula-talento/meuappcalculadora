import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final _controllerNum1 = TextEditingController();
  final _controllerNum2 = TextEditingController();
  String _resultado = '';

  void _calcular(String operacao) {
    if (_controllerNum1.text.isEmpty || _controllerNum2.text.isEmpty) {
      _resultado = 'Informe os números';
    } else {
      double num1 = double.parse(_controllerNum1.text);
      double num2 = double.parse(_controllerNum2.text);

      switch (operacao) {
        case '+':
          _resultado = '${num1 + num2}';
          break;
        case '-':
          _resultado = '${num1 - num2}';
          break;
        case '*':
          _resultado = '${num1 * num2}';
          break;
        case '/':
          if (num2 != 0) {
            _resultado = '${num1 / num2}';
          } else {
            _resultado = 'Divisão por zero!';
          }
          break;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerNum1,
              decoration: const InputDecoration(
                labelText: 'Escreva o priemrio número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controllerNum2,
              decoration: const InputDecoration(
                labelText: 'Escreva o segundo número',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calcular('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}