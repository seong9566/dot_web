import 'package:do_in_web/screen/home/home_screen.dart';
import 'package:do_in_web/screen/profile/edit/profile_content_add_screen.dart';
import 'package:do_in_web/screen/profile/edit/profile_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'screen/profile/profile_screen.dart';

void main() {
  usePathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'profile',
            name: 'profile',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: ProfileScreen());
            },
          ),
          GoRoute(
            path: 'profile_edit',
            name: 'profile_edit',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: ProfileEditScreen());
            },
          ),
          GoRoute(
            path: 'profile_content_add',
            name: 'profile_content_add',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: ProfileContentAddScreen());
            },
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
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
