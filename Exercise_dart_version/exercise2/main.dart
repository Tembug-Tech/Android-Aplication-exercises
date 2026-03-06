List<int> processList(List<int> numbers, bool Function(int) predicate) {
  return numbers.where(predicate).toList();
}

void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];

  var even = processList(nums, (n) => n % 2 == 0);

  print(even);
}