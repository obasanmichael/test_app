import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_app/auth/login/login_form.dart';
import 'package:test_app/components/reviews_container.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  final PageController _pageController = PageController();
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login_image.png'),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/element_logo.png'),
                addHeight(28),
                PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const ReviewContainer(
                        title: 'lol', subText: 'i want too');
                  },
                ),
                addHeight(25),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      activeDotColor: const Color(0xFFFFFFFF),
                      dotColor: const Color(0xFFD9D9D9),
                      dotWidth: 64.w,
                      spacing: 9,
                      dotHeight: 4.h),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r))),
                height: 452.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
