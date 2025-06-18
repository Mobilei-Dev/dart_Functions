void main() {
  // Declare and initialize a map
  Map<String, int> scores = {
    'Math': 90,
    'Science': 85,
    'English': 78
  };

  // Print the entire map
  print('Scores: $scores');

  // Access a value using a key
  print('Math score: ${scores['Math']}');

  // Add a new entry
  scores['History'] = 88;

  // Update an existing entry
  scores['Science'] = 89;

  // Check if a key exists
  if (scores.containsKey('English')) {
    print('English score is recorded.');
  }

  // Loop through map entries
  scores.forEach((subject, score) {
    print('$subject: $score');
  });
}
