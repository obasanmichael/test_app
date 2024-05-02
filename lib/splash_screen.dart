import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_app/components/carousel_container.dart';
import 'package:test_app/components/ratings_container.dart';
import 'package:test_app/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  void _openRatingsLayer() {
    showModalBottomSheet(
      elevation: 0,
      backgroundColor: Colors.white,
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: const RatingsContainer(),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: carouselItems.length,
              itemBuilder: (context, index) {
                final item = carouselItems[index];
                return CarouselContainer(
                  image1: item.image1,
                  image2: item.image2,
                  image3: item.image3,
                  subtext: item.subtext,
                  title: item.title,
                );
              },
            ),
            Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: carouselItems.length,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      activeDotColor: const Color(0xff4B0082),
                      dotColor: const Color(0xffDBCCE6),
                      dotWidth: 30.w,
                      spacing: 15,
                      dotHeight: 10.h),
                ),
                addHeight(14),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 15.h)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xFF4B0082)),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'Open a free account',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
                addHeight(14),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ElevatedButton(
                      onPressed: _openRatingsLayer,
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 15.h)),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color: Color(0xff4B0082))))),
                      child: Text(
                        'Have an account? Log in',
                        style: TextStyle(
                            color: const Color(0xff4B0082), fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
                addHeight(16),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 15.h)),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color: Color(0xff4B0082))))),
                      child: Text(
                        'You can login with Vesti here',
                        style: TextStyle(
                            color: const Color(0xff4B0082), fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
                addHeight(20)
              ],
            )
          ],
        ),
      ),
    );
  }
}
