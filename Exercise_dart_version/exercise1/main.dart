void main() {

  List<int> numbers = [1, 4, 7, 3, 9, 2, 8];

  var filteredNumbers = numbers.where((n) => n > 5);

  var squaredNumbers = filteredNumbers.map((n) => n * n);

  squaredNumbers.forEach((n) => print(n));

}