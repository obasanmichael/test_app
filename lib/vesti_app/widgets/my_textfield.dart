import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VestiTextfield extends StatelessWidget {
  String hint, title;
  TextEditingController contr;
  final Color? titleColor;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final bool isValidate;
  final List<TextInputFormatter>? inputFormatters;
  bool isAmount;
  bool? enabled;
  final String? errorText;
  FocusNode? focusNode;
  final int? maxLines;
  final TextInputType? keyboardType;
  VestiTextfield(
      {Key? key,
      this.titleColor,
      this.focusNode,
      required this.contr,
      required this.hint,
      required this.title,
      this.onChanged,
      this.maxLength,
      this.enabled,
      this.isValidate = true,
      this.maxLines,
      this.inputFormatters,
      required this.isAmount,
      this.validator,
      this.errorText,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color colorPrimary = Color(0xff67A948);
    final Color textLightGreens = Color(0xFF2B5219);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: titleColor ?? colorPrimary),
        ),
        TextFormField(
          controller: contr,
           
          validator:
               validator,
          onChanged: (value) {},
          enabled: enabled,
          maxLength: maxLength,
          maxLines: maxLines,
          focusNode: focusNode,
          cursorColor: colorPrimary,
          // cursorHeight: 10,

          keyboardType: isAmount
              ? TextInputType.number
              : keyboardType ?? TextInputType.text,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: textLightGreens),
          decoration: InputDecoration(
            errorText: errorText,
            errorStyle: TextStyle(
                color: Colors.red, ),
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA0A0A0)),
          ),
        ),
      ],
    );
  }
}
