import 'dart:io';

class Filter {
  String _str =
      "h748r87 21e erf/./3r AAAfsfsfAAAA 12323/23 411dd,44. 3,3.4,  QWE rE Er   218(*&#* aeq";

  String get str => _str;

  set str(String str) => _str = str;

  countWordsAndNumbers() {
    // for printing in red color
    // \x1B[31m{SOME TEXT}\x1B[0m
    print("Your string: " + '\x1B[31m"\x1B[0m' + str + '\x1B[31m"\x1B[0m');
    var s = str.split(RegExp('\\s+'));
    int numbers = 0;
    for (int i = 0; i < s.length; i++) {
      if (isNumber(s[i])) numbers++;
    }
    print(s);
    print("length: " + s.length.toString());
    print("words: " + (s.length - numbers).toString());
    print("numbers: " + numbers.toString());
  }

  // delete words which not start with uppercase letter
  filterWordsWhichStartsWithUppercase() {
    var s = str.split(RegExp('\\s+'));

    List<int> indexesToDelete = [];

    for (String element in s.reversed) {
      isBigLetter(element[0]) ? null : indexesToDelete.add(s.indexOf(element));
    }
    for (int i in indexesToDelete) {
      s.removeAt(i);
    }
    return s.join(" ");
  }

  // deleting all symbols but letters
  filterLetters() {
    return str.replaceAll(RegExp(r"[^A-Za-z]"), "");
  }

  // returns string withouth unecessary spaces
  filterSpaces() {
    return str.replaceAll(RegExp('\\s+'), ' ');
  }

  /// HELPING METHODS
  // check is element a number
  isNumber(String string) {
    if (string.contains(RegExp(r'[a-z]')) || string.contains(RegExp(r'[A-Z]')))
      return false;
    return true;
  }

  // check is string starts from uppercase letter
  isBigLetter(String string) {
    return string[0].contains(RegExp(r'[A-Z]'));
  }
}

void main() {
  stdout.write("Enter your string('def' to use default): ");
  String str = stdin.readLineSync()!;

  Filter filter = new Filter();

  if (str.compareTo('def') != 0) filter.str = str;

  // count words and numbers (p1.1 and p1.2)
  filter.countWordsAndNumbers();

  // p1.3
  str = filter.filterLetters();
  print("P1.3: " + str);

  // p1.4
  str = filter.filterSpaces();
  print("P1.4: " + str);

  //p1.5
  str = filter.filterWordsWhichStartsWithUppercase();
  print("P1.5: " + str);
}
