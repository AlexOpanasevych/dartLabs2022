import 'dart:convert';
import 'dart:io';

class MathHelpers {
  static num fibonacci(int n) {
    return n <= 1 ? n : fibonacci(n - 1) + fibonacci(n - 2);
  }

  static Iterable<num> printSequence(num func(int num), int num) sync* {
    int i = 0;
    while (i < num) {
      yield func(i++);
    }
  }

  static num fact(int n) {
    return n <= 1 ? n : n * fact(n - 1);
  }

  static num countDecimalNumbers(int number) {
    int count = 0;
    while (number != 0) {
      number ~/= 10;
      count++;
    }
    return count;
  }
}

void lab7() {
  bool isCorrect = false;
  int? num;
  while (!isCorrect) {
    try {
      num = int.parse(stdin.readLineSync(encoding: utf8).toString());
      isCorrect = true;
    } on FormatException catch (e) {
      print("Please provide right number:");
    }
  }
  MathHelpers.printSequence(MathHelpers.fibonacci, num!).forEach(print);

  MathHelpers.printSequence(MathHelpers.fact, num).forEach(print);

  print(
      "Count of decimal numbers in $num: ${MathHelpers.countDecimalNumbers(num)}");
}
