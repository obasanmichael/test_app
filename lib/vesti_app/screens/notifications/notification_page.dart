import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/vesti_app/widgets/button.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
    required this.image,
    required this.title,
    required this.body,
    required this.label,
    required this.onPressed,
  });

  final String image;
  final String title;
  final String body;
  final String label;
  final void Function() onPressed;

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
          Image.asset(widget.image),
          SizedBox(height: 16.h),
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
          ),
          SizedBox(height: 16.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.body,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          Spacer(),
          MyButton(label: widget.label, onPressed: () {})
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
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
