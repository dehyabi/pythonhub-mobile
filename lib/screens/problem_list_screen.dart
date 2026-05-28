import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/problem.dart';
import '../providers/problem_provider.dart';
import 'problem_detail_screen.dart';

class ProblemListScreen extends StatefulWidget {
  const ProblemListScreen({super.key});

  @override
  State<ProblemListScreen> createState() => _ProblemListScreenState();
}

class _ProblemListScreenState extends State<ProblemListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Problems'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<ProblemProvider>().clearFilters();
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                context.read<ProblemProvider>().setSearchQuery(value);
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search problems or tags...',
                hintStyle: const TextStyle(color: Color(0xFF8B949E)),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF8B949E)),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Color(0xFF8B949E)),
                        onPressed: () {
                          _searchController.clear();
                          context.read<ProblemProvider>().setSearchQuery('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: const Color(0xFF21262D),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          _buildFilterChips(),
          Expanded(
            child: Consumer<ProblemProvider>(
              builder: (context, provider, child) {
                final problems = provider.problems;
                if (problems.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 48, color: Color(0xFF8B949E)),
                        SizedBox(height: 12),
                        Text(
                          'No problems found',
                          style: TextStyle(color: Color(0xFF8B949E)),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemCount: problems.length,
                  itemBuilder: (context, index) {
                    return _buildProblemCard(context, problems[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Consumer<ProblemProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              _buildDifficultyChip(context, 'All', null, provider),
              _buildDifficultyChip(context, 'Basic', Difficulty.basic, provider),
              _buildDifficultyChip(context, 'Intermediate', Difficulty.intermediate, provider),
              _buildDifficultyChip(context, 'Advanced', Difficulty.advanced, provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDifficultyChip(
    BuildContext context,
    String label,
    Difficulty? difficulty,
    ProblemProvider provider,
  ) {
    final isSelected = provider.filterDifficulty == difficulty;
    Color chipColor;
    if (difficulty == Difficulty.basic) {
      chipColor = const Color(0xFF4CAF50);
    } else if (difficulty == Difficulty.intermediate) {
      chipColor = const Color(0xFFFF9800);
    } else if (difficulty == Difficulty.advanced) {
      chipColor = const Color(0xFFF44336);
    } else {
      chipColor = const Color(0xFF58A6FF);
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) {
          provider.setFilterDifficulty(difficulty);
        },
        backgroundColor: const Color(0xFF21262D),
        selectedColor: chipColor.withOpacity(0.2),
        labelStyle: TextStyle(
          color: isSelected ? chipColor : const Color(0xFFC9D1D9),
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
        side: BorderSide(
          color: isSelected ? chipColor : const Color(0xFF30363D),
        ),
      ),
    );
  }

  Widget _buildProblemCard(BuildContext context, Problem problem) {
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

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF161B22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: problem.isCompleted
              ? const Color(0xFF238636).withOpacity(0.5)
              : const Color(0xFF30363D),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProblemDetailScreen(problemId: problem.id),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: difficultyColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      problem.difficulty.label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: difficultyColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (problem.isCompleted)
                    const Icon(Icons.check_circle, color: Color(0xFF238636), size: 20),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: Icon(
                      problem.isFavorite ? Icons.star : Icons.star_border,
                      color: problem.isFavorite ? const Color(0xFFFFB300) : const Color(0xFF8B949E),
                      size: 20,
                    ),
                    onPressed: () {
                      context.read<ProblemProvider>().toggleFavorite(problem.id);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '${problem.id}. ${problem.title}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                problem.description,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF8B949E),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: problem.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF21262D),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF58A6FF),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
