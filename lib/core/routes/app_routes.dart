import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiking_nepal/core/routes/route_constants.dart';
import 'package:hiking_nepal/di/injection_container.dart';
import 'package:hiking_nepal/features/auth/domain/repository/user_repository.dart';
import 'package:hiking_nepal/features/auth/presentaion/login_screen.dart';

import 'package:hiking_nepal/features/home/presentation/bottom_navigation_page.dart';
import 'package:hiking_nepal/features/home/presentation/home_screen.dart';
import 'package:hiking_nepal/features/post/presentation/pages/add_post_page.dart';
import 'package:hiking_nepal/features/profile/presentation/pages/profile_page.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey();
final GlobalKey<NavigatorState> shellNavigator = GlobalKey();

final GoRouter router = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: '/home',
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      ShellRoute(
        navigatorKey: shellNavigator,
        builder: (context, state, child) {
          return StreamBuilder(
            stream: getIt<UserRepository>().authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.data?.uid != null) {
                return BottomNavigatorPage(
                  child: child,
                );
              } else {
                return const LoginScreen();
              }
            },
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            name: RouteConstants.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/profile',
            name: RouteConstants.profile,
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: '/add-post',
            name: RouteConstants.addPost,
            builder: (context, state) => const AddPostPage(),
          )
        ],
      )
    ]);
