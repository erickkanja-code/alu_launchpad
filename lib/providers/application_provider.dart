import 'package:flutter/foundation.dart';
import '../models/application_model.dart';

class ApplicationProvider extends ChangeNotifier {
  List<ApplicationModel> _applications = [];
  bool _isLoading = false;

  List<ApplicationModel> get applications => _applications;
  bool get isLoading => _isLoading;

  void setApplications(List<ApplicationModel> list) {
    _applications = list;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}