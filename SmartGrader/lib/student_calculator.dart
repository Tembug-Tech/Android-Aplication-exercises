/// Student Calculator (Kilo version)
/// A simple Dart program to manage student scores and grades.

/// Represents a student with a name and an optional score.
class Student {
  /// Student's name.
  String name;
  
  /// Student's score (nullable - can be null if no score is available).
  int? score;
  
  /// Constructor for Student class.
  Student({required this.name, this.score});
  
  /// Returns true if the student has a valid score.
  bool get hasScore => score != null;
}

/// Calculates the letter grade based on the score.
///
/// Returns:
/// - "A" for scores >= 90
/// - "B" for scores >= 80
/// - "C" for scores >= 70
/// - "D" for scores >= 60
/// - "F" for scores < 60
String calculateGrade(int score) {
  if (score >= 90) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else if (score >= 60) {
    return 'D';
  } else {
    return 'F';
  }
}

/// Prints the student's result.
///
/// If the student has a score, prints: "<name> scored <score> : Grade <grade>"
/// If the student has no score, prints: "No score for <name>"
void printResult(Student student) {
  if (student.hasScore) {
    final grade = calculateGrade(student.score!);
    print('${student.name} scored ${student.score} : Grade $grade');
  } else {
    print('No score for ${student.name}');
  }
}

/// Calculates the average score of all students with non-null scores.
///
/// Returns null if no student has a score.
double? calculateAverage(List<Student> students) {
  // Filter students with valid scores
  final studentsWithScores = students.where((s) => s.hasScore).toList();
  
  if (studentsWithScores.isEmpty) {
    return null;
  }
  
  // Calculate sum of all scores
  final sum = studentsWithScores.fold<int>(0, (sum, s) => sum + s.score!);
  
  // Return average
  return sum / studentsWithScores.length;
}

/// Returns the student with the highest score.
///
/// Returns null if no student has a score.
Student? topStudent(List<Student> students) {
  // Filter students with valid scores
  final studentsWithScores = students.where((s) => s.hasScore).toList();
  
  if (studentsWithScores.isEmpty) {
    return null;
  }
  
  // Find the student with the highest score
  return studentsWithScores.reduce(
    (top, current) => current.score! > top.score! ? current : top
  );
}

void main() {
  print('=' * 60);
  print('       STUDENT CALCULATOR (KILO VERSION)');
  print('=' * 60);
  print('');
  
  // Create a list of at least 5 students, some with null scores
  final students = [
    Student(name: 'Alice', score: 95),
    Student(name: 'Bob', score: 78),
    Student(name: 'Charlie', score: null),  // No score
    Student(name: 'Diana', score: 82),
    Student(name: 'Eve', score: 55),
    Student(name: 'Frank', score: null),  // No score
    Student(name: 'Grace', score: 67),
  ];
  
  // 1. Use forEach with a lambda to print each student result
  print('--- ALL STUDENT RESULTS ---');
  students.forEach((student) => printResult(student));
  print('');
  
  // 2. Filter students who passed (score >= 60) and print their names
  print('--- PASSED STUDENTS (Score >= 60) ---');
  final passedStudents = students
    .where((s) => s.hasScore && s.score! >= 60)
    .toList();
  
  // Sort passed students by score (highest to lowest)
  passedStudents.sort((a, b) => b.score!.compareTo(a.score!));
  
  if (passedStudents.isEmpty) {
    print('No students passed.');
  } else {
    passedStudents.forEach((student) {
      final grade = calculateGrade(student.score!);
      print('  - ${student.name}: ${student.score} (Grade: $grade)');
    });
  }
  print('');
  
  // 3. Print the average score of students
  print('--- AVERAGE SCORE ---');
  final average = calculateAverage(students);
  if (average != null) {
    final avgGrade = calculateGrade(average.round());
    print('Average score: ${average.toStringAsFixed(2)} (Grade: $avgGrade)');
  } else {
    print('No average available (no scores recorded).');
  }
  print('');
  
  // 4. Print the top student with star highlight
  print('--- TOP STUDENT ---');
  final top = topStudent(students);
  if (top != null) {
    final grade = calculateGrade(top.score!);
    print('⭐ ${top.name} with score ${top.score} (Grade: $grade)');
  } else {
    print('No top student available (no scores recorded).');
  }
  print('');
  
  // 5. Print pass/fail statistics with percentages
  print('--- PASS/FAIL STATISTICS ---');
  final studentsWithScores = students.where((s) => s.hasScore).toList();
  final passCount = studentsWithScores.where((s) => s.score! >= 60).length;
  final failCount = studentsWithScores.where((s) => s.score! < 60).length;
  final noScoreCount = students.where((s) => !s.hasScore).length;
  
  final totalWithScores = studentsWithScores.length;
  final passPercent = totalWithScores > 0 ? (passCount / totalWithScores * 100) : 0.0;
  final failPercent = totalWithScores > 0 ? (failCount / totalWithScores * 100) : 0.0;
  
  print('Students passed: $passCount (${passPercent.toStringAsFixed(1)}%)');
  print('Students failed: $failCount (${failPercent.toStringAsFixed(1)}%)');
  print('Students with no score: $noScoreCount');
  print('Total students: ${students.length}');
  print('');
  
  // Additional: Show grade distribution using map
  print('--- GRADE DISTRIBUTION ---');
  final gradeDistribution = <String, int>{'A': 0, 'B': 0, 'C': 0, 'D': 0, 'F': 0};
  
  students
    .where((s) => s.hasScore)
    .map((s) => calculateGrade(s.score!))
    .forEach((grade) => gradeDistribution[grade] = gradeDistribution[grade]! + 1);
  
  gradeDistribution.forEach((grade, count) {
    print('Grade $grade: $count student(s)');
  });
  
  print('');
  print('=' * 60);
  print('           CALCULATIONS COMPLETE');
  print('=' * 60);
}
