import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ReviewShimmer extends StatelessWidget {
  const ReviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade400,
      direction: ShimmerDirection.ttb,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 24.h,
                  width: 29.w,
                  color: Colors.grey.shade100,
                ),
                const Spacer(),
                Container(
                    width: 120.w, height: 24.h, color: Colors.grey.shade100),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
                height: 30.h,
                width: double.infinity,
                color: Colors.grey.shade100),
            SizedBox(height: 10.h),
            Container(
              height: 90.h,
              width: double.infinity,
              color: Colors.grey.shade100,
            )
          ],
        ),
      ),
    );
  }
}
// class ReviewShimmer extends StatefulWidget {
//   const ReviewShimmer(
//       {super.key, required this.isLoading, required this.child});

//   final bool isLoading;
//   final Widget child;

//   @override
//   State<ReviewShimmer> createState() => _ReviewShimmerState();
// }

// class _ReviewShimmerState extends State<ReviewShimmer> {
//   @override
//   Widget build(BuildContext context) {
//     if (!widget.isLoading) {
//       return widget.child;
//     }
//     return Shimmer.fromColors(
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
//         child: Column(
//           children: [
            
//           ],
//         ),
//       ),
//     );
//   }
// }
