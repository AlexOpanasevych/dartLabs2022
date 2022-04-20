class Department {
  List<Student> _students = [];

  Department({required Student student}) {
    _students.add(student);
  }

  void addStudent(Student student) => _students.add(student);

  get students => _students;
}

class Student {
  String _name;
  String _surname;
  int _yearOfStudy;
  String specialization = "121";

  Student(
      {required String name, required String surname, required int yearOfStudy})
      : _name = name,
        _surname = surname,
        _yearOfStudy = yearOfStudy;

  get name => _name;

  get surname => _surname;

  get yearOfStudy => _yearOfStudy;

  void _privateMethod() {
    print("Private method");
  }

  /**
   * Calls private method inside class which cannot be called outside class 
   * instance.
   */
  void publicMethod() {
    print("Public method");
    _privateMethod();
  }

  @override
  String toString() {
    return "Class Student {\n  Name: $_name,\n" +
        "  Surname: $_surname,\n" +
        "  Year of study: $_yearOfStudy,\n" +
        "  Specialization: $specialization,\n" +
        "}";
  }
}

void main(List<String> args) {
  Student student1 =
      new Student(name: 'Oleksandr', surname: 'Opanasevych', yearOfStudy: 4);
  print(student1); // same as
  // Using javadoc style (p 1.4)
  /** 
   * That's private method, we can't use it in this file.
   * student._checkPrivate();
   * So I call private method in public method
   * */
  student1.publicMethod();

  Student student2 =
      new Student(name: 'Valentyn', surname: 'Petrenko', yearOfStudy: 4);
  Student student3 =
      new Student(name: 'Kateryna', surname: 'Ivankiv', yearOfStudy: 4);
  Student student4 =
      new Student(name: 'Vitya', surname: 'Kostyanets', yearOfStudy: 4);

  Department department = new Department(student: student1);
  department.addStudent(student2);
  department.addStudent(student3);
  department.addStudent(student4);
  department.students.forEach((element) => print(element));
}
