class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

void main() {
  List<Person> people = [
    Person("Alice", 25),
    Person("Bob", 30),
    Person("Charlie", 35),
    Person("Anna", 22),
    Person("Ben", 28)
  ];

  var filtered = people
      .where((p) => p.name.startsWith('A') || p.name.startsWith('B'));

  var ages = filtered.map((p) => p.age);

  double average = ages.reduce((a, b) => a + b) / ages.length;

  print(average.toStringAsFixed(1));
}