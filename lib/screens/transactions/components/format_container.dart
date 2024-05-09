import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class FormatContainer extends StatefulWidget {
  const FormatContainer({super.key});

  @override
  State<FormatContainer> createState() => _FormatContainerState();
}

class _FormatContainerState extends State<FormatContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 30.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close),
            ),
          ),
          SizedBox(height: 10.h),
          TextField(
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
              prefixIcon: Icon(Icons.picture_as_pdf_outlined),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.h),
                child: RoundCheckBox(
                  onTap: (val) {
                    Navigator.pop(context);
                  },
                  size: 25,
                  checkedColor: Color(0xff4B0082),
                ),
              ),
              hintText: 'pdf'.toUpperCase(),
            ),
            readOnly: true,
          ),
          SizedBox(height: 15.h),
          TextField(
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
              prefixIcon: Icon(Icons.edit_document),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.h),
                child: RoundCheckBox(
                  onTap: (onTap) {},
                  size: 25,
                  checkedColor: Color(0xff4B0082),
                ),
              ),
              hintText: 'Excel',
            ),
            readOnly: true,
          ),
        ],
      ),
    );
  }
}
