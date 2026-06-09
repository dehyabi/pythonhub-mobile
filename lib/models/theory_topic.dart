class TheoryTopic {
  final String id;
  final String title;
  final String category;
  final String description;
  final List<TheorySection> sections;
  final bool isCompleted;

  const TheoryTopic({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.sections,
    this.isCompleted = false,
  });

  TheoryTopic copyWith({bool? isCompleted}) {
    return TheoryTopic(
      id: id,
      title: title,
      category: category,
      description: description,
      sections: sections,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TheorySection {
  final String? heading;
  final String body;
  final String? code;

  const TheorySection({
    this.heading,
    required this.body,
    this.code,
  });
}
