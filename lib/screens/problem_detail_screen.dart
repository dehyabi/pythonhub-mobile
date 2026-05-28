import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/problem.dart';
import '../providers/problem_provider.dart';
import 'solution_screen.dart';

class ProblemDetailScreen extends StatefulWidget {
  final String problemId;

  const ProblemDetailScreen({super.key, required this.problemId});

  @override
  State<ProblemDetailScreen> createState() => _ProblemDetailScreenState();
}

class _ProblemDetailScreenState extends State<ProblemDetailScreen> {
  bool _showHints = false;

  @override
  Widget build(BuildContext context) {
    final problem = Provider.of<ProblemProvider>(context, listen: false)
        .getProblemById(widget.problemId);

    if (problem == null) {
      return const Scaffold(
        body: Center(child: Text('Problem not found')),
      );
    }

    Color difficultyColor;
    switch (problem.difficulty) {
      case Difficulty.basic:
        difficultyColor = const Color(0xFF4CAF50);
        break;
      case Difficulty.intermediate:
        difficultyColor = const Color(0xFFFF9800);
        break;
      case Difficulty.advanced:
        difficultyColor = const Color(0xFFF44336);
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Problem #${problem.id}'),
        actions: [
          IconButton(
            icon: Icon(
              problem.isFavorite ? Icons.star : Icons.star_border,
              color: problem.isFavorite ? const Color(0xFFFFB300) : null,
            ),
            onPressed: () {
              context.read<ProblemProvider>().toggleFavorite(problem.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: difficultyColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    problem.difficulty.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: difficultyColor,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF21262D),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Time: ${problem.timeComplexity}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8B949E),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF21262D),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Space: ${problem.spaceComplexity}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8B949E),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              problem.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF30363D)),
              ),
              child: Text(
                problem.description,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFFC9D1D9),
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: problem.tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF21262D),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF58A6FF),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            if (problem.hints.isNotEmpty) ...[
              InkWell(
                onTap: () => setState(() => _showHints = !_showHints),
                child: Row(
                  children: [
                    Icon(
                      _showHints ? Icons.visibility_off : Icons.lightbulb_outline,
                      color: const Color(0xFFFFB300),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _showHints ? 'Hide Hints' : 'Show Hints (${problem.hints.length})',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFB300),
                      ),
                    ),
                  ],
                ),
              ),
              if (_showHints) ...[
                const SizedBox(height: 12),
                ...problem.hints.asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF21262D),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${entry.key + 1}. ${entry.value}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFC9D1D9),
                          height: 1.4,
                        ),
                      ),
                    ),
                  );
                }),
              ],
              const SizedBox(height: 24),
            ],
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SolutionScreen(problem: problem),
                    ),
                  );
                },
                icon: const Icon(Icons.code, color: Colors.white),
                label: const Text(
                  'View Solution',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF238636),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (!problem.isCompleted)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    context.read<ProblemProvider>().markCompleted(problem.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Marked as completed!'),
                        backgroundColor: Color(0xFF238636),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  icon: const Icon(Icons.check_circle_outline, color: Color(0xFF58A6FF)),
                  label: const Text(
                    'Mark as Completed',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF58A6FF)),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF58A6FF)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
