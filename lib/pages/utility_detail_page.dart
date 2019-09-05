import 'package:flutter/material.dart';
import 'package:shed_app/components/app_scaffold.dart';
import 'package:shed_app/models/utility_model.dart';

class UtilityDetailPage extends StatelessWidget {
  final bool isEditing;
  final UtilityModel utility;

  UtilityDetailPage({this.utility, this.isEditing = false});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: Text("Utility Detail Page"),
      ),
      pageTitle: ValueNotifier("UTILITY DETAIL"),
    );
  }
}
