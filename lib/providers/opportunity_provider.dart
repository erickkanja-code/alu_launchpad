import 'package:flutter/foundation.dart';
import '../models/opportunity_model.dart';

class OpportunityProvider extends ChangeNotifier {
  List<OpportunityModel> _opportunities = [];
  bool _isLoading = false;
  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<OpportunityModel> get opportunities => _opportunities;
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  List<OpportunityModel> get filteredOpportunities {
    return _opportunities.where((opp) {
      final matchesSearch = opp.title
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
      final matchesCategory =
          _selectedCategory == 'All' || opp.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setOpportunities(List<OpportunityModel> list) {
    _opportunities = list;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // temporary — loads fake data until Firebase is connected on Day 5
  void loadFakeData() {
    _opportunities = [
      OpportunityModel(
        id: '1',
        title: 'Frontend Developer Intern',
        description: 'Build mobile apps for our startup',
        category: 'Software Engineering',
        location: 'Kigali, Rwanda',
        duration: '3 Months',
        requirements: 'Basic Flutter knowledge',
        startupId: 'startup1',
        startupName: 'TechNova Solutions',
        status: 'open',
        createdAt: DateTime.now(),
      ),
      OpportunityModel(
        id: '2',
        title: 'Data Analyst Intern',
        description: 'Analyse business data and produce insights',
        category: 'Data Science',
        location: 'Remote',
        duration: '6 Months',
        requirements: 'Python, SQL knowledge',
        startupId: 'startup2',
        startupName: 'Kigali Analytics Group',
        status: 'open',
        createdAt: DateTime.now(),
      ),
      OpportunityModel(
        id: '3',
        title: 'Growth Marketing Intern',
        description: 'Drive social media and content strategy',
        category: 'Marketing',
        location: 'Hybrid - Kigali',
        duration: '3 Months',
        requirements: 'Social media experience',
        startupId: 'startup3',
        startupName: 'EcoSoko',
        status: 'open',
        createdAt: DateTime.now(),
      ),
    ];
    notifyListeners();
  }
}