import 'package:flutter/material.dart';
import '../models/theory_topic.dart';
import '../data/theory.dart';
import 'theory_detail_screen.dart';

class TheoryListScreen extends StatefulWidget {
  const TheoryListScreen({super.key});

  @override
  State<TheoryListScreen> createState() => _TheoryListScreenState();
}

class _TheoryListScreenState extends State<TheoryListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<TheoryTopic> get _filteredTopics {
    if (_searchQuery.isEmpty) return allTheoryTopics;
    final query = _searchQuery.toLowerCase();
    return allTheoryTopics.where((t) {
      return t.title.toLowerCase().contains(query) ||
          t.category.toLowerCase().contains(query) ||
          t.description.toLowerCase().contains(query);
    }).toList();
  }

  Map<String, List<TheoryTopic>> get _groupedTopics {
    final groups = <String, List<TheoryTopic>>{};
    for (final topic in _filteredTopics) {
      groups.putIfAbsent(topic.category, () => []).add(topic);
    }
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Python'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() => _searchQuery = value);
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search theory topics...',
                hintStyle: const TextStyle(color: Color(0xFF8B949E)),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF8B949E)),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Color(0xFF8B949E)),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
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
          Expanded(
            child: _filteredTopics.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 48, color: Color(0xFF8B949E)),
                        SizedBox(height: 12),
                        Text(
                          'No topics found',
                          style: TextStyle(color: Color(0xFF8B949E)),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemCount: _groupedTopics.length,
                    itemBuilder: (context, index) {
                      final category = _groupedTopics.keys.elementAt(index);
                      final topics = _groupedTopics[category]!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4, bottom: 8, top: 8),
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF8B949E),
                              ),
                            ),
                          ),
                          ...topics.map((topic) => _buildTopicCard(context, topic)),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard(BuildContext context, TheoryTopic topic) {
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
              builder: (_) => TheoryDetailScreen(topic: topic),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF238636).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Py',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3FB950),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topic.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      topic.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF8B949E),
                      ),
                      maxLines: 2,
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
      ),
    );
  }
}
