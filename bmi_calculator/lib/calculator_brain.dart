import 'dart:math';

class CalculatorBrain {
  CalculatorBrain(
      {required this.height,
      required this.weight,
      required this.bmi,
      required this.age});

  final int height;
  final int weight;
  final int age;

  double bmi;

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (age <= 24) {
      if (bmi >= 24) {
        return 'Overweight';
      } else if (bmi > 18.5) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    } else if (age > 24 && age <= 34) {
      if (bmi >= 25) {
        return 'Overweight';
      } else if (bmi >= 20) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    } else if (age > 34 && age <= 44) {
      if (bmi >= 26) {
        return 'Overweight';
      } else if (bmi >= 21) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    } else if (age > 44 && age <= 54) {
      if (bmi >= 27) {
        return 'Overweight';
      } else if (bmi >= 22) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    } else if (age > 54 && age <= 64) {
      if (bmi >= 28) {
        return 'Overweight';
      } else if (bmi >= 23) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    } else {
      if (bmi >= 29) {
        return 'Overweight';
      } else if (bmi >= 24) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    }
  }

  String getInterpretation() {
    if (age <= 24) {
      if (bmi >= 24) {
        return 'You have a higher than normal body weight. Try to exercise more.';
      } else if (bmi > 18.5) {
        return 'You have a normal body weight.\n Good job!';
      } else {
        return 'You have a lower than normal body weight. You can eat a bit more.';
      }
    } else if (age > 24 && age <= 34) {
      if (bmi >= 25) {
        return 'You have a higher than normal body weight. Try to exercise more.';
      } else if (bmi >= 20) {
        return 'You have a normal body weight.\n Good job!';
      } else {
        return 'You have a lower than normal body weight. You can eat a bit more.';
      }
    } else if (age > 34 && age <= 44) {
      if (bmi >= 26) {
        return 'You have a higher than normal body weight. Try to exercise more.';
      } else if (bmi >= 21) {
        return 'You have a normal body weight.\n Good job!';
      } else {
        return 'You have a lower than normal body weight. You can eat a bit more.';
      }
    } else if (age > 44 && age <= 54) {
      if (bmi >= 27) {
        return 'You have a higher than normal body weight. Try to exercise more.';
      } else if (bmi >= 22) {
        return 'You have a normal body weight.\n Good job!';
      } else {
        return 'You have a lower than normal body weight. You can eat a bit more.';
      }
    } else if (age > 54 && age <= 64) {
      if (bmi >= 28) {
        return 'You have a higher than normal body weight. Try to exercise more.';
      } else if (bmi >= 23) {
        return 'You have a normal body weight.\n Good job!';
      } else {
        return 'You have a lower than normal body weight. You can eat a bit more.';
      }
    } else {
      if (bmi >= 29) {
        return 'You have a higher than normal body weight. Try to exercise more.';
      } else if (bmi >= 24) {
        return 'You have a normal body weight.\n Good job!';
      } else {
        return 'You have a lower than normal body weight. You can eat a bit more.';
      }
    }
  }
}
