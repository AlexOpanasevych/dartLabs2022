import 'dart:io';

enum Weekd { MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY }

void checkChar(String ch) {
  RegExp expr = new RegExp(r"(?<num>[0-9])|(?<lower>[a-z])|(?<upper>[A-Z])");
  var result = expr.allMatches(ch).first;
  if (result.namedGroup("num") != null) {
    print(ch + " is a number from '0' to '9'.");
    return;
  }
  if (result.namedGroup("lower") != null) {
    print(ch + " is a small latin letter.");
    return;
  }
  if (result.namedGroup("upper") != null) {
    print(ch + " is a latin letter.");
    return;
  }
  print("The character wasn't expected.");
}

extension WithoutEnumName on Weekd {
  get name {
    return this.toString().split('.').last.toLowerCase();
  }
}

void countNextDay(Weekd day) {
  print(
      "Next day: " + Weekd.values[(day.index + 1) % Weekd.values.length].name);
}

class Calculator<T extends num> {
  T _a;
  T _b;

  Calculator({required a, required b})
      : _a = a,
        _b = b;

  get sum => "Sum: " + (_a + _b).toString();
  get subtract => "Subtraction: " + (_a - _b).toString();
  get multiply => "Multiply: " + (_a * _b).toString();
  get division =>
      "Division: " + (_b == 0 ? "can't divide by zero" : (_a / _b).toString());

  set a(a) => _a = a;
  set b(b) => _b = b;

  operation(String operation) {
    switch (operation) {
      case "sum":
        return sum;
      case "subtraction":
      case "sub":
        return subtract;
      case "multiply":
      case "mul":
        return multiply;
      case "division":
      case "div":
        return division;
      default:
        return "Operation wasn't expected.";
    }
  }
}

void main() {
  // task 1
  print("               TASK 1");
  while (true) {
    stdout.write("Enter any character('/' to quit): ");
    String ch = stdin.readLineSync()!;
    if (ch == "/") break;
    checkChar(ch);
  }

  // task 2
  print("               TASK 2, 3");
  while (true) {
    stdout.write("Enter index(1-7): ");
    int index = int.parse(stdin.readLineSync()!);
    if (index < 1 || index > 7) {
      print("Index isn't from range 1-7 or isn't a number.");
      break;
    }
    print(Weekd.values[index - 1].name);

    // task 3
    countNextDay(Weekd.values[index - 1]);
  }

  // task 4
  print("               TASK 4");
  stdout.write("Enter a: ");
  num a = int.parse(stdin.readLineSync()!);
  stdout.write("Enter b: ");
  num b = int.parse(stdin.readLineSync()!);

  Calculator calculator = new Calculator(a: a, b: b);

  print(calculator.sum);
  print(calculator.subtract);
  print(calculator.multiply);
  print(calculator.division);

  String? operation;
  while (operation != "q") {
    stdout.write("Enter a: ");
    a = int.parse(stdin.readLineSync()!);
    stdout.write("Enter b: ");
    b = int.parse(stdin.readLineSync()!);
    calculator.a = a;
    calculator.b = b;
    stdout.write("Enter mathematical operation('q' to quit): ");
    operation = stdin.readLineSync()!;
    print(calculator.operation(operation));
  }

  // task 5
  print("                TASK 5");
  stdout.write("Enter N(N > 3): ");
  int N = int.parse(stdin.readLineSync()!);
  int A, B;
  for (int i = 4; i <= N; i++) {
    A = (i + (5 - (i % 5))) ~/ 5;
    if (i % 2 == 1 || i == 4) {
      A = A + 1;
    }
    B = ((5 * A) - i) ~/ 2;
    if (N != 5 * A - 2 * B) {
      A = A + 1;
      B = ((5 * A) - i) ~/ 2;
    }
    print("N = $i: A = $A, B = $B");
  }
}
