

class CalculatorBrain {
  CalculatorBrain({this.heightt, this.weightt});

  final int heightt;
  final int weightt;

  double _bmi;

  String calculateBMI() {
    _bmi = weightt / (heightt * heightt);
    _bmi = _bmi * 100 * 100;
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String interpret() {
    if (_bmi > 25) {
      return 'You have higher than normal bofy weight try to excercose more.';
    } else if (_bmi > 18) {
      return 'You have normal body weight nice work.';
    } else {
      return 'You have lower than normal body weight try to eat more.';
    }
  }
}
