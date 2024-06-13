import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/components/bottom_nav.dart';
import 'package:test_app/components/details.dart';
import 'package:test_app/components/my_app_bar.dart';
import 'package:test_app/components/my_listtile.dart';
import 'package:test_app/components/process_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget addHeight(double height) => SizedBox(
        height: height.h,
      );
  Widget addWidth(double width) => SizedBox(
        width: width.w,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: ListView(
          children: [
            Row(
              children: [
                const Text('Total balance'),
                addWidth(3),
                const Icon(
                  Icons.info_outline,
                  size: 17,
                ),
                const Spacer(),
              ],
            ),
            addHeight(10),
            Row(
              children: [
                Text(
                  '\$123,456.00',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    wordSpacing: 0,
                    fontFamily: 'Söhne',
                  ),
                ),
                addWidth(5),
                Icon(
                  Icons.visibility_off_outlined,
                  size: 30,
                )
              ],
            ),
            addHeight(15),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Add money',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 38.w, vertical: 15.h),
                    backgroundColor: Color(0xff4B0082),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Send money',
                    style: TextStyle(color: Color(0xff4B0082)),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 38.w, vertical: 15.h),
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xff4B0082)),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
            addHeight(24),
            MyListTile(
              icon: Icon(Icons.phone),
              title: 'Increase Your Transfer Limit',
              subtitle: 'Verify your registered phone number to qualify',
              trailing: Icon(Icons.arrow_right),
              color: Color(0xffE3E6CC),
            ),
            addHeight(35),
            Details(
              title: 'Spend Analytics',
              subtitle: 'Spend Analytics',
              link: 'See Details',
            ),
            addHeight(20),
            const Details(
              title: 'Quick Transactions',
              subtitle: 'Available transactions you can carry out',
              link: 'See all',
            ),
            addHeight(20),
            MyListTile(
              title: 'Direct Deposit',
              subtitle: 'Make payments directly',
              color: Color(0xff1F0036),
              textcolor: Colors.white,
            ),
            addHeight(16),
            MyListTile(
              title: 'Mobile Wallet',
              subtitle: 'Make payments conveniently',
              color: Color(0xff1F0036),
              textcolor: Colors.white,
            ),
            addHeight(16),
            Row(
              children: [
                Expanded(
                    child: ProcessCard(
                  color: Color(0xff23820D),
                  image: 'assets/images/invoice.png',
                )),
                addWidth(20),
                Expanded(
                    child: ProcessCard(
                  color: Color(0xff0B0782),
                  image: 'assets/images/link.png',
                ))
              ],
            ),
            addHeight(40),
            Details(
                title: 'Recent Transactions',
                subtitle: 'View the transactions you have carried out',
                link: 'See all')
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
