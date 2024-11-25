import 'package:flutter/material.dart';
import '../controllers/exercise_three_controller.dart';

class ExerciseThreePage extends StatefulWidget {
  @override
  _ExerciseThreePageState createState() => _ExerciseThreePageState();
}

class _ExerciseThreePageState extends State<ExerciseThreePage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  String result = '';

  void determineOrder() {
    int? num1 = int.tryParse(num1Controller.text);
    int? num2 = int.tryParse(num2Controller.text);

    if (num1 != null && num2 != null) {
      setState(() {
        result = ExerciseThreeController.determineOrder(num1, num2);
      });
    } else {
      setState(() {
        result = 'Por favor, ingrese números válidos.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 3: Orden'),
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
                      'Determine si los números están en orden ascendente o descendente',
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
                      onPressed: determineOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Determinar Orden',
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
