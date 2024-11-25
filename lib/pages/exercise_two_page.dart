import 'package:flutter/material.dart';
import '../controllers/exercise_two_controller.dart';

class ExerciseTwoPage extends StatefulWidget {
  @override
  _ExerciseTwoPageState createState() => _ExerciseTwoPageState();
}

class _ExerciseTwoPageState extends State<ExerciseTwoPage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  String result = '';

  void calculateDifference() {
    int? num1 = int.tryParse(num1Controller.text);
    int? num2 = int.tryParse(num2Controller.text);

    if (num1 != null && num2 != null && num1 > 0 && num2 > 0 && num1 != num2) {
      setState(() {
        result = ExerciseTwoController.calculateDifference(num1, num2);
      });
    } else {
      setState(() {
        result = 'Por favor, ingrese dos números positivos y distintos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 2: Diferencia'),
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
                      'Calcula la diferencia entre dos números',
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
                      onPressed: calculateDifference,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Calcular Diferencia',
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
