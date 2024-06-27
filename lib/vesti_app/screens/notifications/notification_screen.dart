import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/vesti_app/screens/notifications/notification_item.dart';
import 'package:test_app/vesti_app/widgets/account_verified.dart';
import 'package:test_app/vesti_app/widgets/verify_account.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _notificationIsEmpty = false;

  void _openVerificationLayer() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(children: <Widget>[
              Container(
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.only(
                          topLeft:  Radius.circular(25.0),
                          topRight:  Radius.circular(25.0))),
                  child: VerifyAccount())
            ]),
          );
        });
   
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [NotificationItem(), NotificationItem(), NotificationItem()],
    );
    if (_notificationIsEmpty)
      content = Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/empty_notification.svg'),
            SizedBox(height: 5.h),
            Text('No Notifications Yet',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp)),
            SizedBox(height: 10.h),
            Text(
              textAlign: TextAlign.center,
              'You have no notifications right now. \nCome back later',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.sp),
            )
          ],
        ),
      );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/bi_arrow-right.svg'),
          onPressed: _openVerificationLayer,
        ),
        title: Text(
          'Notifications',
          style:
              TextStyle(color: Color(0xff67A948), fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(child: content),
      ),
    );
  }
}
