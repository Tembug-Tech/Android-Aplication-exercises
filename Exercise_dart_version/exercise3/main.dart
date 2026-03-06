void main() {
  List<String> words = ["apple", "cat", "banana", "dog", "elephant"];

  var map = {for (var w in words) w: w.length};

  map.entries
      .where((e) => e.value > 4)
      .forEach((e) => print("${e.key} has length ${e.value}"));
}