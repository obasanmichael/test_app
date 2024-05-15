import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:test_app/providers/filter_date_provider.dart';

class FilterContainer extends ConsumerStatefulWidget {
  const FilterContainer({super.key, required this.onEnter});

  final void Function(DateTime? fromDate, DateTime? toDate) onEnter;

  @override
  ConsumerState<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends ConsumerState<FilterContainer> {
  // late final DateTime date;
  final formatter = DateFormat.yMd();
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;
  int? _selectedDays;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedDays = value;
    });
  }

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
        : ref.read(fromDateProvider);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate ?? DateTime(now.day, now.month, now.year - 1),
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          ref.read(fromDateProvider.notifier).state = pickedDate;
          _fromDateController.text = DateFormat('dd/MM/yy').format(pickedDate);
        } else {
          ref.read(toDateProvider.notifier).state = pickedDate;
          _toDateController.text = DateFormat('dd/MM/yy').format(pickedDate);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final fromDate = ref.watch(fromDateProvider);
    final toDate = ref.watch(toDateProvider);

    if (fromDate != null) {
      _fromDateController.text = DateFormat('dd/MM/yyyy').format(fromDate);
    }

    if (toDate != null) {
      _toDateController.text = DateFormat('dd/MM/yyyy').format(toDate);
    }

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
          DateListTile(
            days: 7,
            // groupValue: _selectedDays == 7,
            // onChanged: (bool? value) {
            //   _handleRadioValueChange(value! ? 7 : null);
            // },
          ),
          DateListTile(
            days: 14,
            // groupValue: _selectedDays == 14,
            // onChanged: (bool? value) {
            //   _handleRadioValueChange(value! ? 14 : null);
            // },
          ),
          DateListTile(
            days: 21,
            // groupValue: _selectedDays == 21,
            // onChanged: (bool? value) {
            //   _handleRadioValueChange(value! ? 21 : null);
            // },
          ),
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
                        onPressed: () {
                          _presentDatePicker(true);
                        },
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
              onPressed: () {
                widget.onEnter(fromDate, toDate);
                Navigator.pop(context);
              },
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
          ),
          SizedBox(height: 10.h)
        ],
      ),
    );
  }
}

class DateListTile extends ConsumerWidget {
  const DateListTile({
    super.key,
    required this.days,
    // required this.groupValue,
    // required this.onChanged,
  });

  final int days;
  // final bool groupValue;
  // final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDays = ref.watch(datePickerProvider);
    DateTime startDate = DateTime.now().subtract(Duration(days: days));

    bool isSelected = selectedDays == days;

    return ListTile(
      contentPadding: EdgeInsets.all(0),
      // leading: RoundCheckBox(
      //   onTap: (val) {},
      //   size: 25,
      //   checkedColor: Color(0xff4B0082),
      // ),
      // value: true,
      // groupValue: groupValue,
      // onChanged: onChanged,
      leading: IconButton(
        onPressed: () {
          ref.read(datePickerProvider.notifier).state = days;
        },
        icon: Image.asset(
          isSelected
              ? 'assets/images/radiobuttonfilled.png'
              : 'assets/images/radiobutton3_unchecked.png',
          width: 30,
        ),
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

      // (bool? value) {
      //   if (value != null) {
      //     setState(() {
      //       _isChecked = value;
      //     });
      //   }
      // },
    );
  }
}


// ${DateFormat('dd/MM/yyyy').format(startDate)} - ${DateFormat('dd/MM/yyyy').format(DateTime.now())}