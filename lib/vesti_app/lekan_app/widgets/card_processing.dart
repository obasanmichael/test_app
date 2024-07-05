import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProcessing extends StatelessWidget {
  const CardProcessing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          Text('Card Order Status', style: TextStyle(color: Color(0xff3E6F26), fontSize: 18.sp, fontWeight: FontWeight.w600),),
          SizedBox(height: 17.h),
          ListTile(title: Text('We’ve received your card order', style: TextStyle(color: Color(0xff999999), fontSize: 12.sp, fontWeight: FontWeight.w500),), subtitle: Text('date', style: TextStyle(color: Color(0xff999999)),),),
          SizedBox(height: 5.h,),
          ListTile(title: Text('Your Card request is processing', style: TextStyle(color: Color(0xff999999), fontSize: 12.sp, fontWeight: FontWeight.w500),),),
          SizedBox(height: 5.h,),
          ListTile(title: Text('Card is out for delivery', style: TextStyle(color: Color(0xff999999), fontSize: 12.sp, fontWeight: FontWeight.w500),),),
          SizedBox(height: 5.h,),
          ListTile(title: Text('Card has been delievered', style: TextStyle(color: Color(0xff999999), fontSize: 12.sp, fontWeight: FontWeight.w500),),),
        ],
      ),
    );
  }
}
