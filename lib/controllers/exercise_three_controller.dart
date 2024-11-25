class ExerciseThreeController {
  static String determineOrder(int num1, int num2) {
    if (num1 < num2) {
      return 'Los números están en orden ascendente';
    } else if (num1 > num2) {
      return 'Los números están en orden descendente';
    } else {
      return 'Los números son iguales';
    }
  }
}
