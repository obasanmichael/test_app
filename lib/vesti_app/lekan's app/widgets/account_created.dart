import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/vesti_app/lekan_app/screens/identity_verification.dart';
import 'package:test_app/vesti_app/widgets/button.dart';

class AccountCreated extends StatelessWidget {
  const AccountCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Image.asset('assets/images/newsuccess.png'),
              Spacer(),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SizedBox(
                  width: 25.w,
                  child: SvgPicture.asset('assets/svg/cancel.svg'),
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Text('Account Created',
              style: TextStyle(
                  color: Color(0xff67A948),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 8.h),
          Text(
            'You have successfully created a Vesti Account. Click on the button below to login and explore Vesti.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.h),
          MyButton(
              label: 'Proceed to Login',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IdentityVerificationScreen()));
              }),
          SizedBox(height: 10.h)
        ],
      ),
    );
  }
}
