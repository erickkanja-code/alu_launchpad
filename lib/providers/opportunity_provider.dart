import 'dart:async';
import 'package:flutter/foundation.dart';
import '../models/opportunity_model.dart';
import '../services/opportunity_service.dart';

class OpportunityProvider extends ChangeNotifier {
  final OpportunityService _service = OpportunityService();

  List<OpportunityModel> _opportunities = [];
  bool _isLoading = false;
  String _searchQuery = '';
  String _selectedCategory = 'All';
  StreamSubscription<List<OpportunityModel>>? _subscription;

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

  // called after student logs in
  void listenToOpportunities() {
    _isLoading = true;
    notifyListeners();

    _subscription?.cancel();
    _subscription = _service.getOpportunitiesStream().listen((list) {
      _opportunities = list;
      _isLoading = false;
      notifyListeners();
    });
  }

  // called after startup logs in
  void listenToStartupOpportunities(String startupId) {
    _isLoading = true;
    notifyListeners();

    _subscription?.cancel();
    _subscription =
        _service.getStartupOpportunitiesStream(startupId).listen((list) {
      _opportunities = list;
      _isLoading = false;
      notifyListeners();
    });
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // cancel stream when provider is destroyed
  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}