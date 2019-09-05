import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shed_app/mock/mock_facilities.dart';
import 'package:shed_app/mock/mock_utility.dart';

import 'package:shed_app/models/message_model.dart';
import 'package:shed_app/models/user_model.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:shed_app/pages/facilities_page.dart';
import 'package:shed_app/pages/facility_create_page.dart';
import 'package:shed_app/pages/facility_detail_page.dart';
import 'package:shed_app/pages/notification_detail_page.dart';
import 'package:shed_app/pages/tenant_detail.dart';
import 'package:shed_app/pages/utilities_page.dart';
import 'package:shed_app/pages/utility_create_page.dart';

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
    return OverlaySupport(
      child: MaterialApp(
        // showPerformanceOverlay: true,
        // debugShowMaterialGrid: true,
        title: 'Facil App',
        theme: shedAppThemeData(),
        home: const SplashPage(),
        routes: {
          'onboarding': (context) => OnboardingPage(),
          'auth': (context) => AuthPage(),
          'home': (context) => DashboardPage(),
          'notifications': (context) => NotificationsPage(),
          'notifications/create': (context) => NotificationCreatePage(),
          'profile': (context) => ProfilePage(),
          'facilities': (context) => FacilityPage(),
          'facilities/create': (context) => FacilityCreatePage(),
          'utilities': (context) => UtilityPage(),
          'utilities/create': (context) => UtilityCreatePage(),
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => DashboardPage(),
          );
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> path = settings.name.split('/');
          switch (path[0]) {
            case 'utilities':
              final data = getUtility(id: path[2]);
              return MaterialPageRoute(
                builder: (BuildContext context) => UtilityCreatePage(
                  isEditing: true,
                  utility: data,
                ),
              );
              break;
            case 'tenant':
              final data = settings.arguments;
              return MaterialPageRoute(
                builder: (BuildContext context) => TenantDetail(
                  tenant: data,
                ),
              );
              break;
            case 'facilities':
              if (path[1] == "detail") {
                final data = getFacility(id: path[2]);
                return MaterialPageRoute(
                  builder: (BuildContext context) => FacilityDetailPage(
                    facility: data,
                  ),
                );
              } else {
                final data = settings.arguments;
                return MaterialPageRoute(
                  builder: (BuildContext context) => FacilityCreatePage(
                    facility: data,
                    isEditing: true,
                  ),
                );
              }
              break;
            case 'notifications':
              final data = MessageModel(
                id: "1",
                title: "My Roof Leaks",
                isRead: false,
                body:
                    """Harmful interruptions take a large toll. An average person gets interrupted many times an hour, has multiple windows open on their computer, checks their email repeatedly, feels that half of their time in meetings is unproductive, and spends a large part of their working time simply looking for the information they need to do their job.""",
                createdAt: DateTime.now(),
                to: "Dirisu Jesse",
                from: UserModel(
                  email: "tenant@facil.com",
                  picture: "assets/img/media.png",
                  type: UserType.TENANT,
                  name: "Ogbeni Ayalegbe",
                  phoneNumber: "+234 820 022 6425",
                ),
              );
              return MaterialPageRoute(
                builder: (BuildContext context) => NotificationDetailPage(
                  isFromMe: path[2] == 'true',
                  message: data,
                ),
              );
              break;
            default:
              return MaterialPageRoute(
                builder: (BuildContext context) => DashboardPage(),
              );
          }
        },
      ),
    );
  }
}
