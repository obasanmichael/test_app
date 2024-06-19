import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border:
                Border.all(color: Colors.grey.shade300), // Adds a grey border
            borderRadius:
                BorderRadius.circular(12.0), // Optional: Adds rounded corners
          ),
          child: ListTile(
            onTap: () {
              context.go('/notificationPage');
            },
            leading: SvgPicture.asset('assets/svg/indicator_dot.svg'),
            title: Text(
              'How to Move Abroad: The Legal Details',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
            ),
            subtitle: Text(
              'Dreaming of Living abroad?',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xff5A5A5A),
                  fontSize: 12.sp),
            ),
            trailing: Text(
              '25 May',
              style: TextStyle(color: Color(0xff999999)),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        )
      ],
    );
  }
}
