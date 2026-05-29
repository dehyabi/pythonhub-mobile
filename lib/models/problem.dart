class Problem {
  final String id;
  final String title;
  final String description;
  final Difficulty difficulty;
  final List<String> tags;
  final String solution;
  final String timeComplexity;
  final String spaceComplexity;
  final String explanation;
  final List<String> hints;
  final List<Example> examples;
  bool isFavorite;
  bool isCompleted;

  Problem({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.tags,
    required this.solution,
    required this.timeComplexity,
    required this.spaceComplexity,
    required this.explanation,
    this.hints = const [],
    this.examples = const [],
    this.isFavorite = false,
    this.isCompleted = false,
  });

  Problem copyWith({
    bool? isFavorite,
    bool? isCompleted,
  }) {
    return Problem(
      id: id,
      title: title,
      description: description,
      difficulty: difficulty,
      tags: tags,
      solution: solution,
      timeComplexity: timeComplexity,
      spaceComplexity: spaceComplexity,
      explanation: explanation,
      hints: hints,
      examples: examples,
      isFavorite: isFavorite ?? this.isFavorite,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class Example {
  final String input;
  final String output;
  final String? explanation;

  const Example({
    required this.input,
    required this.output,
    this.explanation,
  });
}

enum Difficulty { basic, intermediate, advanced }

extension DifficultyExtension on Difficulty {
  String get label {
    switch (this) {
      case Difficulty.basic:
        return 'Basic';
      case Difficulty.intermediate:
        return 'Intermediate';
      case Difficulty.advanced:
        return 'Advanced';
    }
  }

  String get colorHex {
    switch (this) {
      case Difficulty.basic:
        return '#4CAF50';
      case Difficulty.intermediate:
        return '#FF9800';
      case Difficulty.advanced:
        return '#F44336';
    }
  }
}
