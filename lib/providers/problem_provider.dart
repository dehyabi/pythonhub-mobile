import 'package:flutter/material.dart';
import '../models/problem.dart';
import '../data/problems.dart';

class ProblemProvider extends ChangeNotifier {
  List<Problem> _problems = [];
  String _searchQuery = '';
  Difficulty? _filterDifficulty;
  String? _filterTag;

  ProblemProvider() {
    _problems = List.from(allProblems);
  }

  List<Problem> get problems {
    return _problems.where((p) {
      final matchesSearch = _searchQuery.isEmpty ||
          p.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.tags.any((t) => t.toLowerCase().contains(_searchQuery.toLowerCase()));
      final matchesDifficulty = _filterDifficulty == null || p.difficulty == _filterDifficulty;
      final matchesTag = _filterTag == null || p.tags.contains(_filterTag);
      return matchesSearch && matchesDifficulty && matchesTag;
    }).toList();
  }

  List<Problem> get favoriteProblems => _problems.where((p) => p.isFavorite).toList();
  List<Problem> get completedProblems => _problems.where((p) => p.isCompleted).toList();

  int get totalProblems => _problems.length;
  int get completedCount => _problems.where((p) => p.isCompleted).length;
  int get favoriteCount => _problems.where((p) => p.isFavorite).length;

  Difficulty? get filterDifficulty => _filterDifficulty;

  List<String> get allTags {
    final tags = <String>{};
    for (final p in _problems) {
      tags.addAll(p.tags);
    }
    return tags.toList()..sort();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setFilterDifficulty(Difficulty? difficulty) {
    _filterDifficulty = difficulty;
    notifyListeners();
  }

  void setFilterTag(String? tag) {
    _filterTag = tag;
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _filterDifficulty = null;
    _filterTag = null;
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final index = _problems.indexWhere((p) => p.id == id);
    if (index != -1) {
      _problems[index] = _problems[index].copyWith(
        isFavorite: !_problems[index].isFavorite,
      );
      notifyListeners();
    }
  }

  void markCompleted(String id) {
    final index = _problems.indexWhere((p) => p.id == id);
    if (index != -1) {
      _problems[index] = _problems[index].copyWith(isCompleted: true);
      notifyListeners();
    }
  }

  Problem? getProblemById(String id) {
    try {
      return _problems.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
