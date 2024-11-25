import 'package:flutter/material.dart';
import '../controllers/exercise_one_controller.dart';

class ExerciseOnePage extends StatefulWidget {
  @override
  _ExerciseOnePageState createState() => _ExerciseOnePageState();
}

class _ExerciseOnePageState extends State<ExerciseOnePage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  String result = '';

  void checkSigns() {
    String num1Text = num1Controller.text;
    String num2Text = num2Controller.text;

    setState(() {
      result = ExerciseOneController.checkSignOpposite(num1Text, num2Text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 1: Signos Opuestos'),
        backgroundColor: Colors.white60,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white38, Colors.white24],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Verifica si los números tienen signos opuestos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: num1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Número 1',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.filter_1),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: num2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Número 2',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.filter_2),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: checkSigns,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Verificar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (result.isNotEmpty)
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
