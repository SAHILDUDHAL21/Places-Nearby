//import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../hive_helper.dart';

import '../screens/homa_screen.dart';
import '../screens/splash/login_screen.dart';
import '../screens/splash/splash1.dart';
import '../screens/splash/splash2.dart';

//skip karu
String getInitialRoute() {
  if (!HiveHelper.hasSeenSplash()) {
    return '/';
  } else if (!HiveHelper.hasLoggedIn()) {
    return '/login';
  } else {
    return '/home';
  }
}

//ekdam mast kam karte he plugin
//first time using this and now I think there is lot to know about futter

final GoRouter appRouter = GoRouter(
  initialLocation: getInitialRoute(),
  routes: [
    GoRoute(path: '/', builder: (_, __) => const Splash1()),
    GoRoute(path: '/splash2', builder: (_, __) => const Splash2()),
    GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
    GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
  ],
);
