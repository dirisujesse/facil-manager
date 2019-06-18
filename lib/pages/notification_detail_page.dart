import 'package:flutter/material.dart';
import '../components/app_scaffold.dart';

class NotificationDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
      child: Text("Notification Detail"),
    ),
      pageTitle: ValueNotifier("MESSAGE CREATION"),
    );
  }
}
