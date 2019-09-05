import 'package:flutter/material.dart';
// import 'package:shed_app/components/app_spinner.dart';
import 'package:shed_app/models/message_model.dart';
import 'package:shed_app/styles/colors.dart';
import '../components/app_scaffold.dart';

class NotificationDetailPage extends StatelessWidget {
  final MessageModel message;
  final bool isFromMe;

  NotificationDetailPage({
    @required this.message,
    @required this.isFromMe,
  }) : assert(message != null && isFromMe != null);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child:Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                message.title,
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 30),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "${isFromMe ? 'to' : 'from'} ${isFromMe ? message.to : message.from.name}",
                style: Theme.of(context).textTheme.subtitle,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                message.body,
                textAlign: TextAlign.left,
                softWrap: true,
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                maxLines: 5,
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                  // padding: EdgeInsets.all(15.0),
                  onPressed: () => "",
                  child: Text("Reply"),
                ),
              SizedBox(
                height: 10.0,
              ),
              ExpansionTile(
                title: Text("Replies"),
                children: <Widget>[
                  Center(
                    child: Image.asset("assets/img/empty_state.png"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      pageTitle: ValueNotifier(message.title),
    );
  }
}
