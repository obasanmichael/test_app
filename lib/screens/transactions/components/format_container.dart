import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Format { pdf, excel }

class FormatContainer extends StatefulWidget {
  const FormatContainer({super.key, required this.onChecked});

  final void Function(String format) onChecked;

  @override
  State<FormatContainer> createState() => _FormatContainerState();
}

class _FormatContainerState extends State<FormatContainer> {
  Format? selectedFormat;
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
                  color: selectedFormat == Format.pdf
                      ? Color(0xff4B0082)
                      : Color(0xff8D8D8E),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: selectedFormat == Format.pdf
                      ? Color(0xff4B0082)
                      : Color(0xff8D8D8E),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
              prefixIcon: Icon(Icons.picture_as_pdf_outlined),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    selectedFormat =
                        selectedFormat == Format.pdf ? null : Format.pdf;
                    widget.onChecked('PDF');
                  });
                },
                icon: Image.asset(
                  selectedFormat == Format.pdf
                      ? 'assets/images/radiobuttonfilled.png'
                      : 'assets/images/radiobutton3_unchecked.png',
                  width: 30,
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
                  color: selectedFormat == Format.excel
                      ? Color(0xff4B0082)
                      : Color(0xff8D8D8E),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: selectedFormat == Format.excel
                      ? Color(0xff4B0082)
                      : Color(0xff8D8D8E),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
              prefixIcon: Icon(Icons.edit_document),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    selectedFormat =
                        selectedFormat == Format.excel ? null : Format.excel;
                    widget.onChecked('Excel');
                  });
                },
                icon: Image.asset(
                  selectedFormat == Format.excel
                      ? 'assets/images/radiobuttonfilled.png'
                      : 'assets/images/radiobutton3_unchecked.png',
                  width: 30,
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
