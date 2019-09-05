import 'dart:async';

import 'package:shed_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:shed_app/components/image_button.dart';
import '../components/app_scaffold.dart';

import 'package:overlay_support/overlay_support.dart';

import '../styles/colors.dart';

final List<MessageModel> messages = [
  MessageModel(
    isRead: false,
    title: "November Bills",
    body: "All tenants have paid November bills",
    createdAt: DateTime.now(),
  ),
  MessageModel(
    isRead: false,
    title: "Repair Request",
    body: "Mr Ayalegbe, tenant at Agbowo Building requested a repair",
    createdAt: DateTime.now(),
  ),
  MessageModel(
    isRead: false,
    title: "Unresolved Complaint",
    body: "Gloria Dirisu laid a complaint 2 weeks ago which you are yet to attend to",
    createdAt: DateTime.now(),
  ),
  MessageModel(
    isRead: false,
    title: "New Visit Added",
    body: "Donald Trump expects a visitor on 12/04/2020",
    createdAt: DateTime.now(),
  ),
];

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  void showNotifs(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      messages.forEach((message) {
        showOverlayNotification(
          (context) {
            return SafeArea(
              minimum: EdgeInsets.only(top: 130),
              child: Card(
                elevation: 0,
                color: shedAppYellow100,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: shedAppBlue400,
                    child: Text("AB"),
                  ),
                  title: Text(
                    message.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    message.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => OverlaySupportEntry.of(context).dismiss(),
                  ),
                ),
              ),
            );
          },
          duration: Duration(
            milliseconds: 0,
          ),
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();
    showNotifs(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      auomaticallyImplyLeading: false,
      pageTitle: ValueNotifier("DASHBOARD"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.power_settings_new),
          onPressed: () => Navigator.of(context).pushReplacementNamed('auth'),
          iconSize: 40,
        )
      ],
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                "DIRISU JESSE BAYODELE",
                overflow: TextOverflow.visible,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 50.0,
                      color: shedAppBlue300,
                    ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Facility Manager",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style:
                    Theme.of(context).textTheme.display1.copyWith(fontSize: 25),
              ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                "Na God Real Estates Limited",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.body2,
              ),
            ],
          ),
        ),
      ),
      bottomWidget: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                ImageButton(
                  "assets/img/apartment_building.png",
                  caption: "Facilities",
                  onPress: () => Navigator.of(context).pushNamed('facilities'),
                ),
                ImageButton(
                  "assets/img/chat.png",
                  caption: "Communications",
                  onPress: () =>
                      Navigator.of(context).pushNamed('notifications'),
                ),
                ImageButton(
                  "assets/img/utility.png",
                  caption: "Utilities",
                  onPress: () => Navigator.of(context).pushNamed('utilities'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
