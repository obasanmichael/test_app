import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.title,
    required this.subtitle,
    required this.link,
  });

  Widget addHeight(double height) => SizedBox(
        height: height.h,
      );
  Widget addWidth(double width) => SizedBox(
        width: width.w,
      );
  final String title;
  final String subtitle;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            addHeight(2),
            Text(
              subtitle,
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff808D9E)),
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              link,
              style: TextStyle(color: Color(0xff4B0082)),
            ),
            addWidth(3),
            Icon(Icons.arrow_right_alt),
          ],
        )
      ],
    );
  }
}
