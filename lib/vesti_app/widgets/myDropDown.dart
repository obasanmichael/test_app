import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: must_be_immutable

class RadioDropdown extends StatefulWidget {
  RadioDropdown({
    Key? key,
    required this.items,
    required this.labelText,
    required this.hintText,
    this.isDense,
    this.item,
    this.onChanged,
    this.donChanged,
  }) : super(key: key);

  List<String> items;
  final String labelText;
  final String hintText;
  final String? item;
  final bool? isDense;
  final Function(String?)? onChanged;
  Function(String?)? donChanged;
  @override
  State<RadioDropdown> createState() => _RadioDropdownState();
}

class _RadioDropdownState extends State<RadioDropdown> {
  final Color textLightGreens = Color(0xFF2B5219);
  final Color colorPrimary = Color(0xff67A948);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
          validator: dropdownValidator,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Color(0XFF67A948),
          ),
          style: TextStyle(
              fontFamily: "Söhne",
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xff000000),
              overflow: TextOverflow.ellipsis),
          selectedItemBuilder: (context) {
            return widget.items.map((e) {
              return Text(
                e,
                style: GoogleFonts.lato(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    height: 9.38.sp / 8.sp,
                    color: colorPrimary),
              );
            }).toList();
          },
          //  dropdownColor: Color(0XFF67A948),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(width: 0.0, color: textLightGreens),
            ),
            isDense: true,
            filled: true,
            fillColor: Color(0xffF7FFF3),
            labelText: widget.labelText,
            labelStyle: TextStyle(
                color: Color(0xFF67A948),
                fontSize: 12.sp,
                fontFamily: 'Söhne',
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(width: 0.0, color: textLightGreens)),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xFF67A948),
              fontSize: 16.sp,
              fontFamily: 'Söhne',
              fontWeight: FontWeight.w300,
            ),
          ),
          value: widget.item,
          items: widget.items.map((e) {
            return DropdownMenuItem<String>(value: e, child: Text(e));
          }).toList(),
          //
          //     value: e,
          //   );
          // }).toList(),
          onChanged: widget.donChanged
          // (value) {
          //   setState(() {
          //     widget.item = value;
          //   });
          // }
          ),
    );
  }

  FormFieldValidator<String?> dropdownValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please select an item';
    }

    return null; // Return null if the value is valid
  };
}
