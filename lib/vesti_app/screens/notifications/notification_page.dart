import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/vesti_app/widgets/button.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
    // required this.image,
    // required this.title,
    // required this.body,
    // required this.label,
    // required this.onPressed,
  });

  // final String image;
  // final String title;
  // final String body;
  // final String label;
  // final void Function() onPressed;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 18.w),
      child: Column(
        children: [
          Image.asset('assets/images/safelock.png'),
          SizedBox(height: 16.h),
          Text(
            'Introducing SafeLock 💸',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
          ),
          SizedBox(height: 16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saving has never been easier! Use Safelock to reach your migration goal. Set aside funds either automatically or as needed and earn interest to cover necessary expenses.',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Spacer(),
          MyButton(label: 'Learn more', onPressed: () {})
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.go('/notifications');
              },
              icon: SvgPicture.asset('assets/svg/bi_arrow-right.svg')),
          title: Text(
            'Notifications',
            style: TextStyle(
                color: Color(0xff67A948), fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: content);
  }
}
