import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class FilterContainer extends StatefulWidget {
  const FilterContainer({super.key});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  late final DateTime date;
  final formatter = DateFormat.yMd();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _presentDatePicker(bool isFromDate) async {
    final now = DateTime.now();
    final firstDate = isFromDate
        ? DateTime(now.day, now.month, now.year - 1)
        : _selectedFromDate;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate!,
      lastDate: now,
    );

    setState(() {
      if (pickedDate != null) {
        if (isFromDate) {
          _selectedFromDate = pickedDate;
          _fromDateController.text = DateFormat('dd/MM/yy').format(pickedDate);
        } else {
          _selectedToDate = pickedDate;
          _toDateController.text = DateFormat('dd/MM/yy').format(pickedDate);
        }
      }
    });
  }

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
          DateListTile(days: 7),
          DateListTile(days: 14),
          DateListTile(days: 21),
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
                  controller: _fromDateController,
                  // onTap: ()=> _presentDatePicker(isFromDate : true),
                  readOnly: true,
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
                    hintText: 'From',
                    suffixIcon: IconButton(
                        onPressed: () => _presentDatePicker(true),
                        icon: Icon(Icons.calendar_month_outlined)),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: TextField(
                  controller: _toDateController,
                  readOnly: true,
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
                    hintText: 'To',
                    suffixIcon: IconButton(
                        onPressed: () => _presentDatePicker(false),
                        icon: Icon(Icons.calendar_month_outlined)),
                  ),
                ),
              ),
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
  const DateListTile({super.key, required this.days});

  final int days;

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateTime.now().subtract(Duration(days: days));
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
            'Last  ${days} Days',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp),
          ),
          SizedBox(height: 5.h)
        ],
      ),
      subtitle: Text(
        '${DateFormat('dd/MM/yyyy').format(startDate)} - ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
        style: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}
