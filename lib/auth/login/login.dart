import "package:expandable_page_view/expandable_page_view.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "package:test_app/auth/login/login_form.dart";
import "package:test_app/components/reviews_container.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                Flexible(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const ReviewContainer(
                          title: 'The perfect platform for African business',
                          subText:
                              'Element is an absolute game-changer for African entrepreneurs like myself. It\'s a one-stop shop for all my business banking needs,');
                    },
                  ),
                ),
                addHeight(25),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
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
