import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/auth/login/login.dart';
import 'package:test_app/error_page.dart';
import 'package:test_app/home/home_screen.dart';
import 'package:test_app/screens/success_statement.dart';
import 'package:test_app/screens/transactions/transaction_statement.dart';
import 'package:test_app/vesti_app/lekan_app/widgets/card_processing.dart';
import 'package:test_app/vesti_app/screens/migration_support_form.dart';
import 'package:test_app/vesti_app/screens/notifications/notification_screen.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

final GoRouter _router = GoRouter(
  initialLocation: '/card-process',
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
      builder: (BuildContext context, GoRouterState state) =>
          TransactionStatement(),
    ),
    GoRoute(
      path: '/transaction-success',
      builder: (BuildContext context, GoRouterState state) =>
          SuccessStatement(),
    ),
    GoRoute(
      path: '/migration-support',
      builder: (BuildContext context, GoRouterState state) =>
          MigrationSupportForm(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (BuildContext context, GoRouterState state) =>
          NotificationScreen(),
    ),
    GoRoute(
      path: '/card-process',
      builder: (BuildContext context, GoRouterState state) =>
          CardProcessing(),
    ),
    // GoRoute(
    //   path: '/safelock',
    //   builder: (BuildContext context, GoRouterState state) => SafelockScreen(),
    // ),
    // GoRoute(
    //   path: '/notificationPage',
    //   builder: (BuildContext context, GoRouterState state) => NotificationPage(),
    // ),
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
