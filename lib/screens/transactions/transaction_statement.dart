import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionStatement extends StatelessWidget {
  const TransactionStatement({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 26.5.h, horizontal: 32.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_left),
              Text('Transaction Statements', textAlign: TextAlign.center,)
            ],
          )
        ],
      ),
    ));
  }
}
