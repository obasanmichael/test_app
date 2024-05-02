import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProcessCard extends StatelessWidget {
  const ProcessCard({super.key, required this.color, required this.image});

  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(alignment: Alignment.topLeft, child: Image.asset(image)),
          const Spacer(),
          Text(
            'Generate\n Payment Invoice',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
