import 'package:flutter/material.dart';

class MyExpense extends StatelessWidget {
  const MyExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset('assets/images/expense_img.png')
          
        ],
      ),
    );
  }
}