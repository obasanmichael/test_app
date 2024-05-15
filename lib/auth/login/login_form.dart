import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool val = false;
  bool _passwordVisible = false;
  updateCheckbox(bool? newValue) {
    setState(() {
      val = newValue!;
    });
  }

  final _formKey = GlobalKey<FormState>();
  validate(value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget addHeight(double height) => SizedBox(height: height.h);
    Widget addWidth(double width) => SizedBox(width: width.w);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Log in',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        addHeight(16),
        Text(
          'Enter your account details to continue',
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
        ),
        addHeight(24),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please this field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff07000D)),
                      borderRadius: BorderRadius.circular(10.r)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  labelText: 'Email address',
                  hintText: 'Enter your email adress',
                ),
              ),
              addHeight(20),
              TextFormField(
                obscureText: !_passwordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please this field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(_passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff07000D)),
                        borderRadius: BorderRadius.circular(10.r)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    labelText: 'Password',
                    hintText: 'Enter your password'),
              ),
              addHeight(8.h),
              Row(
                children: [
                  Checkbox(
                    splashRadius: 10.r,
                    value: val,
                    onChanged: updateCheckbox,
                  ),
                  Text('Remember me'),
                  const Spacer(),
                  Text(
                    'Forgot password?',
                    style: TextStyle(color: Color(0xff4B0082)),
                  )
                ],
              ),
              addHeight(5.h),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.go("/home");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login successful'),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 15.h)),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFF4B0082)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    child: Text(
                      'Log into your account',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        addHeight(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account?'),
            addWidth(2),
            Text(
              'Open one',
              style: TextStyle(color: Color(0xff4B0082)),
            )
          ],
        )
      ],
    );
  }
}
