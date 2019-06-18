import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final ValueNotifier pageTitle;
  final Widget bottomWidget;
  final List<Widget> actions;

  AppScaffold(
      {@required this.child,
      @required this.pageTitle,
      this.actions = const [SizedBox(width: 0, height: 0)],
      this.bottomWidget = const SizedBox(
        height: 0,
      )})
      : assert(child != null && pageTitle != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          title: Text(
            "FACIL",
            style: Theme.of(context).textTheme.headline,
          ),
          actions: actions),
      body: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: shedAppBlue400,
                ),
                child: ValueListenableBuilder(
                  valueListenable: pageTitle,
                  builder: (context, val, child) {
                    return Text(
                      val,
                      style: Theme.of(context).textTheme.body1.copyWith(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                    );
                  },
                ),
              ),
              height: 40.0,
            ),
            Expanded(
              child: child,
            ),
            bottomWidget,
          ],
        ),
      ),
    );
  }
}
