import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/problem.dart';

class SolutionScreen extends StatelessWidget {
  final Problem problem;

  const SolutionScreen({super.key, required this.problem});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Solution'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Code'),
              Tab(text: 'Explanation'),
              Tab(text: 'Complexity'),
            ],
            labelColor: Color(0xFF58A6FF),
            unselectedLabelColor: Color(0xFF8B949E),
            indicatorColor: Color(0xFF58A6FF),
          ),
        ),
        body: TabBarView(
          children: [
            _buildCodeTab(context),
            _buildExplanationTab(),
            _buildComplexityTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeTab(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1117),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF30363D)),
            ),
            child: SelectableText(
              problem.solution,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: Color(0xFFC9D1D9),
                height: 1.5,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            mini: true,
            backgroundColor: const Color(0xFF238636),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: problem.solution));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Code copied to clipboard'),
                  backgroundColor: Color(0xFF238636),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: const Icon(Icons.copy, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildExplanationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF161B22),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF30363D)),
        ),
        child: Text(
          problem.explanation,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFFC9D1D9),
            height: 1.6,
          ),
        ),
      ),
    );
  }

  Widget _buildComplexityTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildComplexityCard(
            'Time Complexity',
            problem.timeComplexity,
            Icons.timer,
            const Color(0xFF58A6FF),
          ),
          const SizedBox(height: 16),
          _buildComplexityCard(
            'Space Complexity',
            problem.spaceComplexity,
            Icons.memory,
            const Color(0xFFFF9800),
          ),
        ],
      ),
    );
  }

  Widget _buildComplexityCard(String title, String value, IconData icon, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF30363D)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8B949E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
