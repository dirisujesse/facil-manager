import 'package:flutter/material.dart';
import 'package:shed_app/components/app_scaffold.dart';
import 'package:shed_app/models/utility_model.dart';

TextEditingController name;
TextEditingController cost;
TextEditingController description;

class UtilityCreatePage extends StatelessWidget {
  final bool isEditing;
  final UtilityModel utility;

  UtilityCreatePage({this.utility, this.isEditing = false}) {
    name = TextEditingController(text: isEditing ? utility.name : null);
    cost =
        TextEditingController(text: isEditing ? utility.cost.toString() : null);
    description =
        TextEditingController(text: isEditing ? utility.description : null);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: ValueNotifier("UTILITY CREATION"),
      child: Form(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Utility Name"),
                controller: name,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Utility Cost"),
                controller: cost,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Utility Description"),
                controller: description,
                maxLines: null,
                maxLength: 500,
              ),
            ],
          ),
        ),
      ),
      bottomWidget: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: RaisedButton(
          onPressed: () => "",
          child: Text("${isEditing ? 'Update' : 'Create'} Utility"),
        ),
      ),
    );
  }
}
