import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador de Entrada e Saída Mercado',
      home: ContadorScreen(),
    );
  }
}

class ContadorScreen extends StatefulWidget {
  @override
  _ContadorScreenState createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {
  int _contador = 0;
  String _textoEntrada = "Pode Entrar";
  Color _corTexto = Colors.green;

  void _incrementar() {
    if (_contador < 20) {
      setState(() {
        _contador++;
        _atualizarTextoCor();
      });
    }
  }

  void _decrementar() {
    if (_contador > 0) {
      setState(() {
        _contador--;
        _atualizarTextoCor();
      });
    }
  }

  void _atualizarTextoCor() {
    if (_contador <= 5) {
      _textoEntrada = "Pode Entrar";
      _corTexto = Colors.green;
    } else if (_contador <= 10) {
      _textoEntrada = "Pode Entrar";
      _corTexto = Colors.yellow;
    } else if (_contador <= 15) {
      _textoEntrada = "Pode Entrar";
      _corTexto = Colors.orange;
    } else if (_contador < 20) {
      _textoEntrada = "Pode Entrar";
      _corTexto = Colors.red;
    } else {
      _textoEntrada = "Lotado";
      _corTexto = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Contador de Entrada e Saída Mercado',
            style: TextStyle(fontSize: 22),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/img/contador_mercado.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _textoEntrada,
                  style: TextStyle(
                    fontSize: _contador == 20 ? 60 : 48,
                    color: _corTexto,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '$_contador',
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _contador > 0 ? _decrementar : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 75),
                        textStyle: TextStyle(fontSize: 35),
                      ),
                      child: Text('Saiu'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: _contador < 20 ? _incrementar : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 75),
                        textStyle: TextStyle(fontSize: 35),
                      ),
                      child: Text('Entrar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
