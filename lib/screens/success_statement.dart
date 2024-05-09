import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SuccessStatement extends StatelessWidget {
  const SuccessStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Spacer(),
            Image.asset('assets/images/ellipses.png'),
            SizedBox(height: 10.h),
            Text(
              'Successful',
              style: TextStyle(
                  color: Color(0xff4B0082),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5.h),
            Text(
              'Statement generated successfully and sent to your email',
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  backgroundColor: Color(0xff4B0082),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'View Statement',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go("/transaction");
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      side: BorderSide(color: Color(0xff4B0082))),
                ),
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Color(0xff4B0082),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
