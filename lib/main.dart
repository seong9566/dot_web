import 'package:do_in_web/global_nav_key.dart';
import 'package:do_in_web/screen/default_layout.dart';
import 'package:do_in_web/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'screen/profile/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => DefaultLayout(page: HomeScreen()),
        routes: [
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) => DefaultLayout(page: ProfileScreen()),
          ),
        ],
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
