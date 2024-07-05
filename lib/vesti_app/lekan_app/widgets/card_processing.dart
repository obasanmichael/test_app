import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProcessing extends StatelessWidget {
  const CardProcessing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Card Order Status',
              style: TextStyle(
                  color: Color(0xff3E6F26),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 17.h),
            _buildStep(
              context,
              title: "We've received your card order",
              subtitle: '2:10pm May 20',
              isActive: true,
              showLine: true,
            ),
            _buildStep(
              context,
              title: 'Your Card request is processing',
            ),
            _buildStep(
              context,
              title: 'Card is out for delivery',
              subtitle: 'Estimated delivery date: 26th May',
            ),
            _buildStep(
              context,
              title: 'Card has been delivered',
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildStep(BuildContext context,
    {required String title,
    String? subtitle,
    bool isActive = false,
    bool showLine = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h),
    child: SizedBox(
      height: 54.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              DottedBorder(
                borderType: BorderType.Circle,
                dashPattern: isActive ? [1, 0] : [4, 4],
                color: isActive ? Color(0xff3E6F26) : Colors.grey,
                strokeWidth: 2,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isActive ? Color(0xff3E6F26) : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: isActive
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        )
                      : null,
                ),
              ),
              SizedBox(height: 8.h),
              if (showLine)
                DottedLine(
                  direction: Axis.vertical,
                  lineLength: 20,
                  lineThickness: 2.0,
                  dashLength: 4.0,
                  dashColor: Color(0xff3E6F26),
                ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isActive ? Color(0xff3E6F26) : Colors.grey,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: isActive ? Colors.grey : Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
