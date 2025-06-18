// Define a class for a student
class Student {
  String name;
  List<int> scores;

  Student({required this.name, required this.scores});

  // Calculate average
  double getAverage() {
    if (scores.isEmpty) return 0.0;
    int total = scores.reduce((a, b) => a + b);
    return total / scores.length;
  }

  // Determine grade
  String getGrade() {
    double avg = getAverage();
    if (avg >= 80) return "A";
    if (avg >= 70) return "B";
    if (avg >= 60) return "C";
    if (avg >= 50) return "D";
    return "E";
  }

  // Display student details
  void displayDetails() {
    print("📘 Student: $name");
    print("📊 Scores: $scores");
    print("📈 Average: ${getAverage().toStringAsFixed(2)}");
    print("🎓 Grade: ${getGrade()}\n");
  }
}

void main() {
  // Create a list of students
  List<Student> students = [
    Student(name: "Mobilei", scores: [80, 85, 78]),
    Student(name: "Amdany", scores: [65, 70, 60]),
    Student(name: "Cosmas", scores: [40, 45, 50]),
  ];

  // Loop through and print each student's details
  for (var student in students) {
    student.displayDetails();
  }
}

