import 'package:flutter/material.dart';
import 'package:shed_app/components/app_scaffold.dart';

class NotificationCreatePage extends StatelessWidget {
  final ValueNotifier _type = ValueNotifier(null);
  final ValueNotifier _to = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
              ValueListenableBuilder(
                valueListenable: _to,
                builder: (context, to, child) {
                  return DropdownButtonFormField(
                    value: to,
                    hint: Text("To"),
                    items: [
                      DropdownMenuItem(
                        value: "All Tenants",
                        child: Text("All Tenants"),
                      ),
                      DropdownMenuItem(
                        value: "All Tenants at Agbowo Complex",
                        child: Text("All Tenants at Agbowo Complex"),
                      ),
                      DropdownMenuItem(
                        value: "All Tenants at Aso Rock",
                        child: Text("All Tenants at Aso Rock"),
                      ),
                      DropdownMenuItem(
                        value: "Ogbeni Ayalegbe tenant at Aso Rock",
                        child: Text("Ogbeni Ayalegbe tenant at Aso Rock"),
                      ),
                    ],
                    onChanged: (val) {
                      _to.value = val;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              ValueListenableBuilder(
                valueListenable: _type,
                builder: (context, type, child) {
                  return DropdownButtonFormField(
                    value: type,
                    hint: Text("Message Type"),
                    items: [
                      DropdownMenuItem(
                        value: "Payment Reminder",
                        child: Text("Payment Reminder"),
                      ),
                      DropdownMenuItem(
                        value: "Complaint",
                        child: Text("Complaint"),
                      ),
                      DropdownMenuItem(
                        value: "Welcome Message",
                        child: Text("Welcome Message"),
                      ),
                      DropdownMenuItem(
                        value: "Announcement",
                        child: Text("Announcement"),
                      ),
                    ],
                    onChanged: (val) {
                      _type.value = val;
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Title"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Body"),
                maxLines: null,
                maxLength: 2000,
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      pageTitle: ValueNotifier("MESSAGE CREATION"),
      bottomWidget: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: RaisedButton(
          onPressed: () => "",
          child: ValueListenableBuilder(
            valueListenable: _type,
            builder: (context, type, child) {
              return Text("Send ${type ?? 'Message'}");
            },
          ),
        ),
      ),
    );
  }
}
