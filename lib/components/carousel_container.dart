import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/components/reviews_container.dart';

class CarouselContainer extends StatelessWidget {
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);
  const CarouselContainer(
      {super.key,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.subtext,
      required this.title});
  final String image1;
  final String image2;
  final String image3;
  final String title;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 33.w, top: 10.h),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 33.w),
                child: Image.asset(
                  image1,
                  height: 371.h,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                left: 7.w,
                top: 25.h,
                child: Container(
                  width: 56.w,
                  child: Image.asset(image2),
                ),
              ),
              Positioned(
                bottom: 30.w,
                right: 0,
                child: const ReviewContainer(
                    title: 'A Must-Have for African Startups',
                    subText:
                        'Element is an absolute game-changer for African entrepreneurs. It makes it incredibly easy to manage my business finances.'),
              )
            ],
          ),
          addHeight(20),
          Container(
            padding: EdgeInsets.only(left: 50.w),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF4B0082)),
                ),
                addHeight(2),
                Text(
                  subtext,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFF8755AC),
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
