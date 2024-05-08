import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/auth/login/login.dart';
import 'package:test_app/error_page.dart';
import 'package:test_app/home/home_screen.dart';
import 'package:test_app/screens/transactions/transaction_statement.dart';
import 'package:test_app/splash_screen.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  initialLocation: '/transaction',
  errorPageBuilder: (context, state) => const MaterialPage(child: ErrorPage()),
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => Login(),
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => HomeScreen(),
    ),
    GoRoute(
      path: '/transaction',
      builder: (BuildContext context, GoRouterState state) => TransactionStatement(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // final GoRouter _router = GoRouter(routes: [
  //   GoRoute(path: '/', builder: (context, state) => Login()),
  //   GoRoute(path: '/home', builder: (context, state) => HomeScreen())
  // ]);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, child) {
          return MaterialApp.router(
            routerConfig: _router,
          );
        });
  }
}
