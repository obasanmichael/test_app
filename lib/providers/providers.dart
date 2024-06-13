import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/review.dart';
import 'package:test_app/services/api_service.dart';

final reviewProvider = FutureProvider<List<Review>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.fetchReviews();
});

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
