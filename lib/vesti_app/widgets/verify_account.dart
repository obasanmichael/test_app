import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_app/vesti_app/widgets/account_verified.dart';
import 'package:test_app/vesti_app/widgets/button.dart';

class VerifyAccount extends StatelessWidget {
  VerifyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final Color colorLightGrey = Color(0xFFF0F0F0);
    final Color colorGrey = Colors.grey;
    String _code;

    void openVerificationLayer() {
      Navigator.pop(context);
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
                    child: AccountVerified())
              ]),
            );
          });
    }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              Text(
                'Verify your account',
                style: TextStyle(
                    color: Color(0xff67A948),
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp),
              ),
              Spacer(),
              SvgPicture.asset('assets/svg/cancel.svg'),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Input the PIN sent to your registered email address to verify your account.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          // SizedBox(
          //     width: double.infinity,
          //     child: Image.asset(
          //       'assets/images/PIN.png',
          //       fit: BoxFit.cover,
          //     )),

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
          SizedBox(height: 19.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Didn\'t get code?'),
              Text(
                'Resend here',
                style: TextStyle(
                    color: Color(0xff67A948),
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(height: 32.h),
          MyButton(label: 'Verify', onPressed: () => openVerificationLayer()),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
