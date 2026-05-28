import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/problem.dart';
import '../providers/problem_provider.dart';
import 'problem_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<ProblemProvider>(
        builder: (context, provider, child) {
          final favorites = provider.favoriteProblems;
          if (favorites.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star_border, size: 48, color: Color(0xFF8B949E)),
                  SizedBox(height: 12),
                  Text(
                    'No favorites yet',
                    style: TextStyle(color: Color(0xFF8B949E)),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Star problems to save them here',
                    style: TextStyle(color: Color(0xFF6E7681), fontSize: 13),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return _buildFavoriteCard(context, favorites[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, Problem problem) {
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
        side: const BorderSide(color: Color(0xFF30363D)),
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
          child: Row(
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
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${problem.id}. ${problem.title}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      problem.tags.join(', '),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8B949E),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.star, color: Color(0xFFFFB300), size: 20),
                onPressed: () {
                  context.read<ProblemProvider>().toggleFavorite(problem.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
