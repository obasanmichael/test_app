import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class FilterContainer extends StatefulWidget {
  const FilterContainer({super.key});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Filter by Days',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          DateListTile(),
          SizedBox(height: 0.h),
          DateListTile(),
          SizedBox(height: 0.h),
          DateListTile(),
          SizedBox(height: 5.h),
          Text(
            'Filter by Calendar',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff8D8D8E),
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff8D8D8E),
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                  hintText: 'from',
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                ),
              )),
              SizedBox(width: 16.w),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff8D8D8E),
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff8D8D8E),
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                  hintText: 'to',
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                ),
              )),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                backgroundColor: Color(0xff4B0082),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Enter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DateListTile extends StatelessWidget {
  const DateListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: RoundCheckBox(
        onTap: (val) {},
        size: 25,
        checkedColor: Color(0xff4B0082),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last  7 Days',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 5.h)
        ],
      ),
      subtitle: Text('19 Nov., 2023 - 26 Nov., 2023'),
    );
  }
}
