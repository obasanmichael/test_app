import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        child: AppBar(
          leading: CircleAvatar(
            radius: 3,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello, Tolu'),
              Text(
                'What would you like to do today?',
                style: TextStyle(fontSize: 14.sp),
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                size: 35,
              ),
              onPressed: () {},
            ),
          ],
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80.h);
}
