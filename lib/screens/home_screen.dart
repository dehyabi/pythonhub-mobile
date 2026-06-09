import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/problem.dart';
import '../providers/problem_provider.dart';
import 'problem_list_screen.dart';
import 'favorites_screen.dart';
import 'theory_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ProblemProvider>(
          builder: (context, provider, child) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PythonHub',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildStatsCard(provider),
                        const SizedBox(height: 24),
                        const Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2.8,
                      mainAxisSpacing: 12,
                    ),
                    delegate: SliverChildListDelegate([
                      _buildActionCard(
                        context,
                        'Learn Python',
                        'History, fundamentals & advanced topics',
                        const Color(0xFF2DBAAA),
                        Icons.menu_book,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TheoryListScreen(),
                          ),
                        ),
                      ),
                      _buildCategoryCard(
                        context,
                        'Basic Problems',
                        'Fundamentals: Arrays, Strings, Linked Lists',
                        Difficulty.basic,
                        const Color(0xFF4CAF50),
                        Icons.school,
                      ),
                      _buildCategoryCard(
                        context,
                        'Intermediate Problems',
                        'Algorithms: DP, Graphs, Trees, Design',
                        Difficulty.intermediate,
                        const Color(0xFFFF9800),
                        Icons.trending_up,
                      ),
                      _buildCategoryCard(
                        context,
                        'Advanced Problems',
                        'Expert: Complex DP, System Design, Optimization',
                        Difficulty.advanced,
                        const Color(0xFFF44336),
                        Icons.local_fire_department,
                      ),
                      _buildActionCard(
                        context,
                        'All Problems',
                        'Browse all 100 problems',
                        const Color(0xFF58A6FF),
                        Icons.list,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProblemListScreen(),
                          ),
                        ),
                      ),
                      _buildActionCard(
                        context,
                        'Favorites',
                        '${provider.favoriteCount} saved problems',
                        const Color(0xFFFFB300),
                        Icons.star,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FavoritesScreen(),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatsCard(ProblemProvider provider) {
    final progress = provider.totalProblems > 0
        ? provider.completedCount / provider.totalProblems
        : 0.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF30363D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Progress',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                '${provider.completedCount}/${provider.totalProblems}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF58A6FF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFF21262D),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF238636)),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('Completed', provider.completedCount.toString(), const Color(0xFF238636)),
              _buildStatItem('Favorites', provider.favoriteCount.toString(), const Color(0xFFFFB300)),
              _buildStatItem('Remaining', (provider.totalProblems - provider.completedCount).toString(), const Color(0xFF8B949E)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF8B949E),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String subtitle,
    Difficulty difficulty,
    Color color,
    IconData icon,
  ) {
    return InkWell(
      onTap: () {
        final provider = context.read<ProblemProvider>();
        provider.setFilterDifficulty(difficulty);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ProblemListScreen(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF30363D)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8B949E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF8B949E),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    String title,
    String subtitle,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF30363D)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8B949E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF8B949E),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
