import 'package:flutter/material.dart';
import '../components/app_scaffold.dart';
import '../styles/colors.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: ValueNotifier("DASHBOARD"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () => "",
        )
      ],
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 14.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: shedAppBlue400,
                    backgroundImage: AssetImage(
                      "assets/img/IMG-01.jpg",
                    ),
                    radius: 40.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "DIRISU JESSE BAYODELE",
                    overflow: TextOverflow.visible,
                    style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                          color: shedAppBlue300,
                        ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Property Agent",
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.display1,
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Text(
                    "Na God Real Estates Limited",
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.title,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomWidget: Container(
        decoration: BoxDecoration(
          color: shedAppBlue400,
        ),
        height: MediaQuery.of(context).size.height * 0.3,
        padding: EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 14.0,
        ),
        child: GridView.count(
          crossAxisCount: 3,
          semanticChildCount: 3,
          children: <Widget>[
            Card(
              elevation: 0.0,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(20.0),
              //   ),
              // ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 40,
                      color: shedAppBlue300,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Manage Properties",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: shedAppBlue400,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0.0,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //     // topLeft: Radius.circular(20.0),
              //     bottomRight: Radius.circular(20.0),
              //   ),
              // ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add_alert,
                      size: 40,
                      color: shedAppBlue300,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Create Alert",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: shedAppBlue400,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0.0,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //     // topLeft: Radius.circular(20.0),
              //     bottomRight: Radius.circular(20.0),
              //   ),
              // ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: 40,
                      color: shedAppBlue300,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Manage Utilities",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: shedAppBlue400,
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
