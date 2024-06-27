import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_app/vesti_app/widgets/button.dart';
import 'package:test_app/vesti_app/lekan_app/widgets/account_created.dart';


class SecurePinScreen extends StatelessWidget {
  const SecurePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String _code;
    final Color colorLightGrey = Color(0xFFF0F0F0);
    final Color colorGrey = Colors.grey;
    void openVerificationLayer() {
      showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext bc) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Wrap(children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0))),
                    child: AccountCreated())
              ]),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/svg/bi_arrow_right.svg')),
        title: Text(
          'Step 4 of 4',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Set up your secure PIN',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8.h),
            Text(
                'To carry out transactions on Vesti you will need to create a four (4) digits PIN code.'),
            SizedBox(height: 32.h),
            Text('Enter Your Desired Transaction PIN'),
            SizedBox(height: 16.h),
            PinCodeTextField(
                appContext: context,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                backgroundColor: Colors.transparent,
                length: 4,
                obscureText: true,
                validator: (v) {
                  if (v!.length < 4) {
                    return "Invalid pin";
                  } else {
                    return null;
                  }
                },
                animationType: AnimationType.fade,
                //shape: PinCodeFieldShape.underline,
                animationDuration: Duration(milliseconds: 300),
                pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(5),
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 60.w,
                  fieldWidth: 60.w,
                  activeFillColor: Color(0xFFF6FEF3),
                  inactiveColor: Color(0xFFF6FEF3),
                  activeColor: Color(0xFF67A948),
                  inactiveFillColor: Color(0xFFF6FEF3),
                  selectedFillColor: Color(0xFFF6FEF3),
                ),
                keyboardType: TextInputType.number,
                enableActiveFill: true,
                onCompleted: (value) {},
                onChanged: (value) => _code = value.trim()),
            SizedBox(height: 23.h),
            Text('Confirm Transaction PIN'),
            SizedBox(height: 16.h),
            PinCodeTextField(
                appContext: context,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                backgroundColor: Colors.transparent,
                length: 4,
                obscureText: true,
                validator: (v) {
                  if (v!.length < 4) {
                    return "Invalid pin";
                  } else {
                    return null;
                  }
                },
                animationType: AnimationType.fade,
                //shape: PinCodeFieldShape.underline,
                animationDuration: Duration(milliseconds: 300),
                pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(5),
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 60.w,
                  fieldWidth: 60.w,
                  activeFillColor: Color(0xFFF6FEF3),
                  inactiveColor: Color(0xFFF6FEF3),
                  activeColor: Color(0xFF67A948),
                  inactiveFillColor: Color(0xFFF6FEF3),
                  selectedFillColor: Color(0xFFF6FEF3),
                ),
                keyboardType: TextInputType.number,
                enableActiveFill: true,
                onCompleted: (value) {},
                onChanged: (value) => _code = value.trim()),
            Spacer(),
            MyButton(
                label: 'Create account',
                onPressed: () {
                  openVerificationLayer();
                }),
            SizedBox(height: 10.h)
          ],
        ),
      ),
    );
  }
}
