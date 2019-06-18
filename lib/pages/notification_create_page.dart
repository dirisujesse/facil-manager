import 'package:flutter/material.dart';
import 'package:shed_app/components/app_scaffold.dart';

class NotificationCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: Text("Notification Creation Page"),
      ),
      pageTitle: ValueNotifier("MESSAGE CREATION"),
    );
  }
}
