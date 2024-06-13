import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/providers/providers.dart';
import 'login_form.dart';
import '../../components/review_shimmer.dart';
import '../../components/reviews_container.dart';
// import '../../providers.dart'; // Add this import

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final PageController _pageController = PageController();
  late Timer _timer;

  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_pageController.hasClients) {
        final reviews = ref.read(reviewProvider).asData?.value ?? [];
        int nextPage = _pageController.page!.round() + 1;
        if (nextPage >= reviews.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reviewAsyncValue = ref.watch(reviewProvider);

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image.asset(
            'assets/images/login_image.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/element_logo.png'),
                addHeight(15),
                reviewAsyncValue.when(
                  data: (reviews) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 225.h,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: reviews.length,
                            itemBuilder: (context, index) {
                              return ReviewContainer(
                                ratingNo: reviews[index].ratings,
                                title: reviews[index].username,
                                subText: reviews[index].comment,
                              );
                            },
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: reviews.length,
                          axisDirection: Axis.horizontal,
                          effect: SlideEffect(
                            activeDotColor: const Color(0xFFFFFFFF),
                            dotColor: const Color(0xFFD9D9D9),
                            dotWidth: 32.w,
                            spacing: 15,
                            dotHeight: 8.h,
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () => const ReviewShimmer(),
                  error: (err, stack) => Text('Error: $err'),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 452.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 15.h),
              child: const LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
