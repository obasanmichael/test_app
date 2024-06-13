import 'package:flutter/material.dart';
import '../models/review.dart';
import '../services/api_service.dart';

class LoginViewModel with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Review> _reviews = [];
  bool _isLoading = true;
  String _error = '';

  List<Review> get reviews => _reviews;
  bool get isLoading => _isLoading;
  String get error => _error;

  LoginViewModel() {
    _loadReviews();
  }

  void _loadReviews() async {
    try {
      final reviews = await _apiService.fetchReviews();
      _reviews = reviews;
      _isLoading = false;
    } catch (error) {
      _error = error.toString();
      _isLoading = false;
    }
    notifyListeners();
  }
}
