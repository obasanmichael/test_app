import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "package:test_app/auth/login/login_form.dart";
import "package:test_app/components/review_shimmer.dart";
import "package:test_app/components/reviews_container.dart";
import "package:test_app/models/review.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Review> _reviews = [];
  final PageController _pageController = PageController();
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);
  var _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  void _loadReviews() async {
    final dio = Dio();
    const url =
        'https://elementapi.wevesti.com/api/element/get_reviews?source=InApp';
    try {
      final response = await dio.get(url);
      if (response.statusCode != 200) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
          _isLoading = false;
        });
        return;
      }
      if (response.data == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }
      final Map<String, dynamic> responseData = response.data;
      final List<dynamic> listData = responseData['data'];
      final List<Review> loadedReviews = listData.map((item) {
        return Review(
          username: item['username'],
          comment: item['comment'],
          ratings: item['ratings'].toDouble(), // Ensure ratings is a double
          reviewId: item['reviewId'],
        );
      }).toList();

      setState(() {
        _reviews = loadedReviews;
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _error = 'An error occurred. Please try again later.';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // https://chat.google.com/dm/hWamHMAAAAE/nI9NZWY2U8Y/nI9NZWY2U8Y?cls=10

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image.asset(
            'assets/images/login_image.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/element_logo.png'),
                addHeight(28),
                
                if (_error.isNotEmpty)
                  Text(
                    _error,
                    style: TextStyle(color: Colors.red),
                  )
                else
                  Flexible(
                    // child: ReviewShimmer(),
                    child: _isLoading? const ReviewShimmer() : PageView.builder(
                      controller: _pageController,
                      itemCount: _reviews.length,
                      itemBuilder: (context, index) {
                        return ReviewContainer(
                            ratingNo: _reviews[index].ratings.toDouble(),
                            title: _reviews[index].username,
                            subText: _reviews[index].comment);
                      },
                    ),
                  ),
                addHeight(25),
                if (!_isLoading && _reviews.isNotEmpty)
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _reviews.length,
                    axisDirection: Axis.horizontal,
                    effect: SlideEffect(
                        activeDotColor: const Color(0xFFFFFFFF),
                        dotColor: const Color(0xFFD9D9D9),
                        dotWidth: 32.w,
                        spacing: 15,
                        dotHeight: 8.h),
                  ),
              ],
            ),
          ),
          Positioned(
            // top: 350.h,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 452.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r))),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 15.h),
              child: LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
