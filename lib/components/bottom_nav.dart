import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined), label: 'Cards'),
        BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined), label: 'Transactions'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.more_outlined), label: 'More'),
      ],
      currentIndex: _currentIndex,
      elevation: 0,
      unselectedItemColor: Color(0xff868686),
  
      selectedItemColor: Color(0xff4B0082),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
