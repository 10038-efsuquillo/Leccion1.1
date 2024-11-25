class ExerciseOneController {
  static String checkSignOpposite(String num1Text, String num2Text) {
    // Validar que los valores sean numéricos
    if (!_isNumeric(num1Text) || !_isNumeric(num2Text)) {
      return 'Por favor, ingrese solo números.';
    }

    int num1 = int.parse(num1Text);
    int num2 = int.parse(num2Text);

    if ((num1 > 0 && num2 < 0) || (num1 < 0 && num2 > 0)) {
      return 'Signos opuestos';
    } else if (num1 == 0 || num2 == 0) {
      return 'Ha ingresado un 0';
    }
    return 'No son signos opuestos';
  }

  // Método auxiliar para verificar si el texto es un número
  static bool _isNumeric(String str) {
    if (str.isEmpty) return false;
    return double.tryParse(str) != null;
  }
}
