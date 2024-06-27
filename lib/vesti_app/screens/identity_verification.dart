import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/vesti_app/screens/secure_pin.dart';
import 'package:test_app/vesti_app/widgets/button.dart';
import 'package:test_app/vesti_app/widgets/myDropDown.dart';
import 'package:test_app/vesti_app/widgets/my_textfield.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/svg/bi_arrow_right.svg')),
        title: Text(
          'Step 2 of 3',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 20.h),
        child: Column(
          children: [
            Text(
              'Verify your identity',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8.h),
            Text(
                'Please provide your most recent  residential address to enjoy smoother services.'),
            SizedBox(height: 32.h),
            RadioDropdown(
                items: [
                  'National Identification Number (NIN)',
                  'Bank Verification Number (BVN)',
                  'International Passport',
                  'Voters Card'
                ],
                labelText: 'Select Identification Document',
                hintText: 'IDENTIFICATION DOCUMENT'),
            SizedBox(height: 24.h),
            VestiTextfield(
                contr: _textController,
                hint: '',
                title: 'IDENTIFICATION NUMBER',
                isAmount: false),
            Spacer(),
            MyButton(
                label: 'Verify',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecurePinScreen(),
                    ),
                  );
                }),
            SizedBox(height: 10.h)
          ],
        ),
      ),
    );
  }
}
