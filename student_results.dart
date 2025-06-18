import 'dart:io';

// Define the Student class
class Student {
  String name;
  List<int> scores;

  Student({required this.name, required this.scores});

  double getAverage() {
    if (scores.isEmpty) return 0.0;
    int total = scores.reduce((a, b) => a + b);
    return total / scores.length;
  }

  String getGrade() {
    double avg = getAverage();
    if (avg >= 80) return "A";
    if (avg >= 70) return "B";
    if (avg >= 60) return "C";
    if (avg >= 50) return "D";
    return "F";
  }

  void displayDetails() {
    print("\n📘 Student: $name");
    print("📊 Scores: $scores");
    print("📈 Average: ${getAverage().toStringAsFixed(2)}");
    print("🎓 Grade: ${getGrade()}");
  }
}

// Helper to get integer input
int getIntInput(String prompt) {
  stdout.write(prompt);
  return int.parse(stdin.readLineSync()!);
}

// Main entry point
void main() {
  List<Student> students = [];

  stdout.write("👥 Enter number of students: ");
  int numStudents = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < numStudents; i++) {
    stdout.write("\nEnter name for student ${i + 1}: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter number of scores for $name: ");
    int numScores = int.parse(stdin.readLineSync()!);
    List<int> scores = [];
    for (int j = 0; j < numScores; j++) {
      scores.add(getIntInput("  Enter score ${j + 1}: "));
    }
    students.add(Student(name: name, scores: scores));
  }

  // Display details for all students
  for (var student in students) {
    student.displayDetails();
  }
}