import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingsContainer extends StatefulWidget {
  const RatingsContainer({super.key});

  @override
  State<RatingsContainer> createState() => __RatingsContainerStateState();
}

class __RatingsContainerStateState extends State<RatingsContainer> {
  double _rating = 0;
  String _review = '';
  final _formkey = GlobalKey<FormState>();

  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.h);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 186.h,
            color: Color(0xffF7EDFF),
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Image.asset('assets/images/comment_icon.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Share Your Experience',
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: Color(0xff07000D),
                        fontWeight: FontWeight.w500),
                  ),
                  addHeight(16),
                  Text(
                    textAlign: TextAlign.center,
                    'You just created your account! Please use the star rating and review box to share your experience.',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff89888A)),
                  ),
                  addHeight(14),
                  RatingBar.builder(
                    initialRating: _rating,
                    unratedColor: Color(0xFFCDCCCF),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color(0xFF4B0082),
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  ),
                  addHeight(20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('Enter your review');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      // border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      fillColor: const Color(0xFFF5F5F5),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 24.h, horizontal: 24.w),
                      hintText: 'Write your review',
                    ),
                    maxLines: 5,
                  ),
                  addHeight(20),
                  Row(children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(150.w, 50.h),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: const BorderSide(
                            color: Color(0xFF4B0082),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Ask me later',
                        style: TextStyle(color: Color(0xFF4B0082)),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Navigator.pop(
                              context, {'rating': _rating, 'review': _review});
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Your review has been recorded'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(150.w, 50.h),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                        ),
                        backgroundColor: const Color(0xFF4B0082),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: const BorderSide(
                            color: Color(0xFF4B0082),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
