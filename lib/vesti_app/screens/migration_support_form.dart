import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MigrationSupportForm extends StatefulWidget {
  const MigrationSupportForm({super.key});

  @override
  State<MigrationSupportForm> createState() => _MigrationSupportFormState();
}

class _MigrationSupportFormState extends State<MigrationSupportForm> {
  Widget addHeight(double height) => SizedBox(height: height.h);
  Widget addWidth(double width) => SizedBox(width: width.w);
  final TextEditingController _controller = TextEditingController();
  Color _currentFillColor = Color(0xffF7F8FA);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateFillColor);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateFillColor);
    _controller.dispose();
    super.dispose();
  }

  void _updateFillColor() {
    setState(() {
      if (_controller.text.isEmpty) {
        _currentFillColor = Color(0xffF7F8FA);
      } else {
        _currentFillColor = Color(0xffF7FFF3);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
          title: Text(
            'Loan Application',
            style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeight(20),
                Text(
                  'Enter Application Details',
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
                ),
                Column(
                  children: [
                    addHeight(20),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                            fillColor: _currentFillColor, //Color(0xFFF6FEF3),
                            filled: true,
                            hintText: 'Alternative phone number',
                            labelText: 'ALTERNATIVE PHONE NUMBER',
                            hintStyle: TextStyle(
                              color: Color(0xFF2A3147),
                              fontSize: 16,
                              fontFamily: 'Söhne',
                              fontWeight: FontWeight.w300,
                              height: 0.06,
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF67A948),
                              fontSize: 8,
                              fontFamily: 'Söhne',
                              fontWeight: FontWeight.w700,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2A3147)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF67A948)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            //Color(0xFF2A3147)
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF67A948)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        addHeight(24),
                        TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                            fillColor: _currentFillColor, //Color(0xFFF6FEF3),
                            filled: true,
                            hintText: 'How much loan do you need?',
                            labelText: 'loan amount'.toUpperCase(),
                            hintStyle: TextStyle(
                              color: Color(0xFF2A3147),
                              fontSize: 16,
                              fontFamily: 'Söhne',
                              fontWeight: FontWeight.w300,
                              height: 0.06,
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFF67A948),
                              fontSize: 8,
                              fontFamily: 'Söhne',
                              fontWeight: FontWeight.w700,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2A3147)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF67A948)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            //Color(0xFF2A3147)
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF67A948)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        addHeight(24),
                        DropdownButtonFormField(
                            icon: Icon(Icons.expand_more),
                            decoration: InputDecoration(
                              fillColor: _currentFillColor, //Color(0xFFF6FEF3),
                              filled: true,
                              hintText: 'Do you have a Vesti account number? *',
                              labelText: 'do you have a vesti account number?'
                                  .toUpperCase(),
                              hintStyle: TextStyle(
                                color: Color(0xFF2A3147),
                                fontSize: 16,
                                fontFamily: 'Söhne',
                                fontWeight: FontWeight.w300,
                                height: 0.06,
                              ),
                              labelStyle: TextStyle(
                                color: Color(0xFF67A948),
                                fontSize: 8,
                                fontFamily: 'Söhne',
                                fontWeight: FontWeight.w700,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.h),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF2A3147)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF67A948)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              //Color(0xFF2A3147)
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF67A948)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            items: [],
                            onChanged: (val) {}),
                        addHeight(24),
                        DropdownButtonFormField(
                            icon: Icon(Icons.expand_more),
                            decoration: InputDecoration(
                              fillColor: _currentFillColor, //Color(0xFFF6FEF3),
                              filled: true,
                              hintText: 'Do you have a Vesti account number? *',
                              labelText: 'do you have a vesti account number?'
                                  .toUpperCase(),
                              hintStyle: TextStyle(
                                color: Color(0xFF2A3147),
                                fontSize: 16,
                                fontFamily: 'Söhne',
                                fontWeight: FontWeight.w300,
                                height: 0.06,
                              ),
                              labelStyle: TextStyle(
                                color: Color(0xFF67A948),
                                fontSize: 8,
                                fontFamily: 'Söhne',
                                fontWeight: FontWeight.w700,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.h),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF2A3147)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF67A948)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              //Color(0xFF2A3147)
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF67A948)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            items: [],
                            onChanged: (val) {}),
                        addHeight(24),
                        DropdownButtonFormField(
                            icon: Icon(Icons.expand_more),
                            decoration: InputDecoration(
                              fillColor: _currentFillColor, //Color(0xFFF6FEF3),
                              filled: true,
                              hintText: 'Do you have a Vesti account number? *',
                              labelText: 'do you have a vesti account number?'
                                  .toUpperCase(),
                              hintStyle: TextStyle(
                                color: Color(0xFF2A3147),
                                fontSize: 16,
                                fontFamily: 'Söhne',
                                fontWeight: FontWeight.w300,
                                height: 0.06,
                              ),
                              labelStyle: TextStyle(
                                color: Color(0xFF67A948),
                                fontSize: 8,
                                fontFamily: 'Söhne',
                                fontWeight: FontWeight.w700,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.h),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF2A3147)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF67A948)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              //Color(0xFF2A3147)
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF67A948)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            items: [],
                            onChanged: (val) {}),
                        addHeight(24),
                        DropdownButtonFormField(
                            icon: Icon(Icons.expand_more),
                            decoration: InputDecoration(
                              fillColor: _currentFillColor, //Color(0xFFF6FEF3),
                              filled: true,
                              hintText: 'Do you have a Vesti account number? *',
                              labelText: 'do you have a vesti account number?'
                                  .toUpperCase(),
                              hintStyle: TextStyle(
                                color: Color(0xFF2A3147),
                                fontSize: 16,
                                fontFamily: 'Söhne',
                                fontWeight: FontWeight.w300,
                                height: 0.06,
                              ),
                              labelStyle: TextStyle(
                                color: Color(0xFF67A948),
                                fontSize: 8,
                                fontFamily: 'Söhne',
                                fontWeight: FontWeight.w700,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 15.h),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF2A3147)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF67A948)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              //Color(0xFF2A3147)
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF67A948)),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            items: [],
                            onChanged: (val) {}),
                        addHeight(24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // disabledBackgroundColor: ,
                                  padding: EdgeInsets.symmetric(vertical: 17.h),
                                  backgroundColor: _controller.text.isEmpty
                                      ? Colors.grey
                                      : Color(0xff67A948),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              onPressed:
                                  _controller.text.isEmpty ? null : () {},
                              child: Text(
                                'Submit Application',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            // validator: dropdownValidator,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0XFF67A948),
                            ),
                            style: TextStyle(
                              fontFamily: "Söhne",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff000000),
                            ),
                            // selectedItemBuilder: (context) {
                            //   return regCtrl.selectedCards.map((e) {
                            //     return Text(
                            //       e,
                            //       style: GoogleFonts.lato(
                            //           fontSize: 13.sp,
                            //           fontWeight: FontWeight.w400,
                            //           height: 9.38.sp / 8.sp,
                            //           color: colorPrimary),
                            //     );
                            //   }).toList();
                            // },
                            //  dropdownColor: Color(0XFF67A948),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.r),
                                borderSide: BorderSide(
                                    width: 0.0, color: Color(0xffF7FFF3)),
                              ),
                              isDense: true,
                              filled: true,
                              fillColor: Color(0xffF7FFF3),
                              labelText: "WOULD YOU LIKE A FREE DEBIT CARD?",
                              // labelStyle: GoogleFonts.lato(
                              //     fontSize: 13.sp,
                              //     fontWeight: FontWeight.w400,
                              //     height: 9.38.sp / 8.sp,
                              //     color: colorPrimary),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(
                                      width: 0.0, color: Color(0xffF7FFF3))),
                              hintText: 'WOULD YOU LIKE A FREE DEBIT CARD?',
                              // hintStyle: GoogleFonts.lato(
                              //     fontSize: 15.sp,
                              //     fontWeight: FontWeight.w400,
                              //     color: Color(0xFFA0A0A0)),
                            ),
                            // value: regCtrl.selectedCard,
                            items: [],
                            onChanged: (val) {},
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
