import 'dart:io';
import 'dart:convert';
import 'dart:math';

num maxn<T extends num>(T a, T b, T c, T d) {
  return max(max(max(a, b), c), d);
}

num maxList<T extends num>(List<T> args) {
  num maxNum = args[0];
  for (var item in args) {
    maxNum = max(item, maxNum);
  }

  return maxNum;
}

void lab6() {
  print("Type a, b, c, d, x (e.g 1, 2, 3, 4, 5):");
  var input = stdin.readLineSync(encoding: utf8)?.split(", ");
  assert(input?.length == 5);
  var a = num.parse(input![0]);
  var b = num.parse(input[1]);
  var c = num.parse(input[2]);
  var d = num.parse(input[3]);
  var x = num.parse(input[4]);
  print("y = MAX(a, b, c, d) = ${maxn(a, b, c, d)}");
  print("y = MAX(a, b, c, d) =  ${maxList([a, b, c, d])}");
  print("y = x^4 =  ${pow(x, 4)}");
  print("y = ax^2 + bx + c =  ${a * pow(x, 2) + b * x + c}");

  print("Type a, b, c, d, y (e.g 1, 2, 3, 4, 5):");

  input = stdin.readLineSync(encoding: utf8)?.split(", ");

  a = num.parse(input![0]);
  b = num.parse(input[1]);
  c = num.parse(input[2]);
  d = num.parse(input[3]);
  var y = num.parse(input[4]);

  print("y = x^4 =  ${pow(x, 4)}");
  print(
      "y = ax^2 + bx + c => x_1 = (c - y) / sqrt(a * (y - c + b)) = ${(c - y) / sqrt(a * (y - c + b))}; x_2 = sqrt(y - c + b) / a) = ${sqrt((y - c + b) / a)};");
  print("y = ax + c => x = (y - c) / a = ${(y - c) / a}");
}
