import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewContainer extends StatelessWidget {
  const ReviewContainer(
      {super.key,
      required this.title,
      required this.subText,
      required this.ratingNo});

  final String title;
  final String subText;
  final double ratingNo;
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/quote2_icon.png',
                color: Colors.white,
                width: 29.w,
                height: 24.h,
              ),
              const Spacer(),
              RatingBar.builder(
                  itemSize: 30,
                  initialRating: ratingNo,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color(0xffFCE340),
                      ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  }),
            ],
          ),
          addHeight(16),
          Text(
            title,
            style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w600,
                fontSize: 20.sp),
          ),
          addHeight(5),
          Text(
            subText,
            style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
