import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shed_app/components/app_scaffold.dart';
import 'package:shed_app/components/app_spinner.dart';
import 'package:shed_app/models/message_model.dart';
import 'package:shed_app/models/user_model.dart';
import 'package:shed_app/styles/colors.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationsPageState();
  }
}

class _NotificationsPageState extends State<NotificationsPage>
    with TickerProviderStateMixin {
  TabController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "createMessae",
        tooltip: "Create Message",
        onPressed: () =>
            Navigator.of(context).pushNamed("notifications/create"),
        child: Icon(Icons.edit),
      ),
      bottom: TabBar(
        controller: _ctrl,
        tabs: <Widget>[
          Tab(
            child: Text(
              "SENT",
            ),
          ),
          Tab(
            child: Text(
              "RECEIVED",
            ),
          )
        ],
      ),
      child: TabBarView(
        controller: _ctrl,
        children: <Widget>[
          MessageList(
            isFromMe: true,
          ),
          MessageList()
        ],
      ),
      pageTitle: ValueNotifier("NOTIFICATIONS"),
    );
  }
}

class MessageList extends StatelessWidget {
  final bool isFromMe;
  MessageList({this.isFromMe = false});

  Future<List<MessageModel>> _getMessages() async {
    await Future.delayed(Duration(seconds: 5));
    return Future.value(
      List.generate(
        30,
        (idx) => MessageModel(
          id: idx.toString(),
          title: "My Roof Leaks",
          isRead: false,
          body:
              """Harmful interruptions take a large toll. An average person gets interrupted many times an hour, has multiple windows open on their computer, checks their email repeatedly, feels that half of their time in meetings is unproductive, and spends a large part of their working time simply looking for the information they need to do their job.""",
          createdAt: DateTime.now(),
          to: "Dirisu Jesse",
          from: UserModel(
            email: "tenant@facil.com",
            picture: "assets/img/media.png",
            type: UserType.TENANT,
            name: "Ogbeni Ayalegbe",
            phoneNumber: "+234 820 022 6425",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMessages(),
      builder: (context, res) {
        if (res.hasError) {
          return Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/empty_state.png'),
              ),
            ),
          );
        }
        if (res.hasData) {
          if (res.data.length <= 0) {
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/no_messages.png'),
                ),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: res.data.length,
            itemBuilder: (context, idx) {
              final it = res.data[idx];
              final names =
                  isFromMe ? it.to.split(" ") : it.from.name.split(" ");
              return Dismissible(
                key: Key(idx.toString()),
                child: GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.0,
                    ),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // CircleAvatar(
                        //   backgroundColor: shedAppBlue300,
                        //   child: Text(
                        //     names.length > 1
                        //         ? "${names[0][0]}${names[1][0]}"
                        //         : "${names[0][0]}${names[0][1]}",
                        //     textAlign: TextAlign.center,
                        //     style:
                        //         Theme.of(context).textTheme.display1.copyWith(
                        //               color: Colors.white,
                        //             ),
                        //   ),
                        //   radius: 30.0,
                        // ),
                        // SizedBox(
                        //   width: 10.0,
                        // ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 14.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: idx != (res.data.length - 1)
                                      ? BorderSide(
                                          color: Colors.grey, width: 0.5)
                                      : BorderSide.none),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Table(
                                  columnWidths: {
                                    0: FlexColumnWidth(6),
                                    1: FlexColumnWidth(3)
                                  },
                                  children: [
                                    TableRow(
                                      children: [
                                        Text(
                                          it.title,
                                          maxLines: 1,
                                          style:
                                              Theme.of(context).textTheme.title,
                                          textAlign: TextAlign.start,
                                        ),
                                        Text(
                                          DateFormat.yMEd()
                                              .format(it.createdAt),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "${isFromMe ? 'to' : 'from'} ${names.join(" ")}",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle
                                      .copyWith(
                                          fontWeight: idx % 2 == 0 || isFromMe
                                              ? FontWeight.normal
                                              : FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                !isFromMe
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 3,
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: shedAppYellow300,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Text(idx % 2 == 0
                                              ? "Complaint"
                                              : "Repair Request"),
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  height: !isFromMe ? 5.0 : 0,
                                ),
                                Text(
                                  it.body,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontWeight: idx % 2 == 0 || isFromMe
                                              ? FontWeight.normal
                                              : FontWeight.bold),
                                ),
                                !isFromMe
                                    ? Align(
                                        alignment: Alignment.bottomRight,
                                        child: GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 5,
                                            ),
                                            child: Text(
                                              "Mark as read",
                                              style: TextStyle(
                                                color: shedAppBlue100,
                                              ),
                                            ),
                                          ),
                                          onTap: () {},
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Navigator.of(context)
                      .pushNamed('notifications/detail/$isFromMe/1'),
                ),
                onDismissed: (dir) => "",
                direction: DismissDirection.endToStart,
              );
            },
          );
        } else {
          return AppSpinner();
        }
      },
    );
  }
}
