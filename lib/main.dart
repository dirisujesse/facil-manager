import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles/theme.dart';

import 'pages/splash_screen_page.dart';
import 'pages/auth_page.dart';
import 'pages/onboarding_page.dart';
import 'pages/dashboard_page.dart';
import './pages/notifications_page.dart';
import './pages/notification_create_page.dart';
import './pages/profile_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      // debugShowMaterialGrid: true,
      title: 'Facil App',
      theme: shedAppThemeData(),
      home: const SplashPage(),
      routes: {
        'onboarding': (context) => OnboardingPage(),
        'auth': (context) => AuthPage(),
        'home': (context) => DashboardPage(),
        'notificatons': (context) => NotificationListPage(),
        'notificatons/create': (context) => NotificationCreatePage(),
        'profile': (context) => ProfilePage(),
      },
    );
  }
}
