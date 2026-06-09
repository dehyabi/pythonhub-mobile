import 'package:flutter/material.dart';
import '../models/theory_topic.dart';

class TheoryDetailScreen extends StatelessWidget {
  final TheoryTopic topic;

  const TheoryDetailScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF30363D)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF21262D),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      topic.category,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF58A6FF),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    topic.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8B949E),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ...topic.sections.map((section) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (section.heading != null) ...[
                    Text(
                      section.heading!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                  Text(
                    section.body,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFC9D1D9),
                      height: 1.6,
                    ),
                  ),
                  if (section.code != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D1117),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF30363D)),
                      ),
                      child: SelectableText(
                        section.code!,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: Color(0xFFC9D1D9),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                ],
              );
            }),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
