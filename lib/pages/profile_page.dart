import 'package:flutter/material.dart';
import 'package:shed_app/components/app_scaffold.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: Text("Profile Page"),
      ),
      pageTitle: ValueNotifier("PROFILE"),
    );
  }
}
