import 'package:dio/dio.dart';
import '../models/review.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Review>> fetchReviews() async {
    const url =
        'https://elementapi.wevesti.com/api/element/get_reviews?source=InApp';
    try {
      final response = await _dio.get(url);
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch data');
      }

      final Map<String, dynamic> responseData = response.data;
      final List<dynamic> listData = responseData['data'];

      return listData.map((item) {
        return Review(
          reviewId: item['reviewId'],
          username: item['username'],
          comment: item['comment'],
          ratings: item['ratings'].toDouble(),
        );
      }).toList();
    } catch (error) {
      throw Exception('Failed to fetch data');
    }
  }
}
