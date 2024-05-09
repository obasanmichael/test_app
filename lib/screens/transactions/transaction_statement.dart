import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/screens/transactions/components/app_bar.dart';
import 'package:test_app/screens/transactions/components/filter_container.dart';
import 'package:test_app/screens/transactions/components/format_container.dart';

class TransactionStatement extends StatefulWidget {
  const TransactionStatement({super.key});

  @override
  State<TransactionStatement> createState() => _TransactionStatementState();
}

class _TransactionStatementState extends State<TransactionStatement> {
  Widget addHeight(double height) => SizedBox(height: height.h);

  Widget addWidth(double width) => SizedBox(width: width.w);

  void _openDurationLayer() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            Container(
              child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0))),
                child: FilterContainer(),
              ),
            )
          ]);
        });
    // showModalBottomSheet(
    //   isScrollControlled: true,
    //   context: context,
    //   builder: (BuildContext ctx) => const FilterContainer(),
    // );
  }

  void _openFormatLayer() {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            Container(
              child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0))),
                child: FormatContainer(),
              ),
            )
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 26.5.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the necessary details',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Color(0xff414244),
              ),
            ),
            addHeight(24),
            TextFormField(
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
                suffixIcon: Icon(Icons.keyboard_arrow_down),
                hintText: 'Duration',
              ),
              onTap: _openDurationLayer,
              readOnly: true,
            ),
            addHeight(16),
            TextFormField(
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
                    borderRadius: BorderRadius.circular(10.r)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                suffixIcon: Icon(Icons.keyboard_arrow_down),
                hintText: 'Format',
              ),
              onTap: _openFormatLayer,
              readOnly: true,
            ),
            addHeight(15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/transaction-success');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  backgroundColor: Color(0xff4B0082),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'Generate',
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
      ),
    );
  }
}
