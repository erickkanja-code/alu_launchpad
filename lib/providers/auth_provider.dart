import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _currentUser != null;
  String get role => _currentUser?.role ?? '';

  void setUser(UserModel? user) {
    _currentUser = user;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  // placeholder — real logic comes Day 4
  Future<bool> signIn({required String email, required String password}) async {
    setLoading(true);
    setError(null);
    // Firebase logic comes Day 4
    setLoading(false);
    return false;
  }

  Future<bool> signUp({required String email, required String password, required String role}) async {
    setLoading(true);
    setError(null);
    // Firebase logic comes Day 4
    setLoading(false);
    return false;
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }
}