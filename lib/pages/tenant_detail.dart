import 'package:shed_app/models/tenant_model.dart';
import 'package:shed_app/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

NumberFormat formatter;

class TenantDetail extends StatefulWidget {
  final TenantModel tenant;
  TenantDetail({@required this.tenant}) : assert(tenant != null);
  @override
  State<StatefulWidget> createState() {
    return _TenantDetailState();
  }
}

class _TenantDetailState extends State<TenantDetail>
    with TickerProviderStateMixin {
  TabController _ctrlr;

  @override
  void initState() {
    super.initState();
    _ctrlr = TabController(vsync: this, length: 3);
    _ctrlr.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _ctrlr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    formatter = NumberFormat.currency(
      name: "NGN",
      symbol: "NGN ",
      decimalDigits: 2,
      locale: Localizations.localeOf(context).toString(),
    );
    return Scaffold(
      backgroundColor: shedAppYellow50,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.mail_outline),
        label: Text("Message Tenant"),
        onPressed: () => Navigator.of(context).pushNamed("notifications/create"),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, isScroll) {
          return [
            SliverAppBar(
              floating: false,
              pinned: true,
              leading: BackButton(
                color: Colors.white,
              ),
              centerTitle: true,
              title: Text(
                widget.tenant.name.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .body2
                    .copyWith(color: Colors.white),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              backgroundColor: shedAppBlue400,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.tenant.name,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/img/loading.png"),
                        colorFilter: ColorFilter.mode(
                          Colors.black54,
                          BlendMode.darken,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/img/loading.png",
                          ),
                          radius: 80,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Apartment 2, Aso Villa, 2 Bode Thomas Road, Ilupeju, Lagos.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.body1.copyWith(
                                color: Colors.white,
                              ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  color: Colors.white,
                                ),
                            children: [
                              TextSpan(text: "0810011534"),
                              TextSpan(text: " | "),
                              TextSpan(
                                text: "ogbeniaya@mail.com",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  labelPadding: EdgeInsets.symmetric(vertical: 15),
                  controller: _ctrlr,
                  tabs: <Widget>[
                    Text(
                      "OVERVIEW",
                      style: TextStyle(color: shedAppBodyBlack),
                    ),
                    Text(
                      "DEPENDENTS",
                      style: TextStyle(color: shedAppBodyBlack),
                    ),
                    Text(
                      "VISITS",
                      style: TextStyle(color: shedAppBodyBlack),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _ctrlr,
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 200, top: 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(
                            left: 14.0,
                            right: 14.0,
                            top: 10.0,
                            bottom: 5.0,
                          ),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: 14.0,
                                    right: 14.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    "OUTSTANDING BILLS",
                                    style: Theme.of(context).textTheme.body2,
                                    // .copyWith(color: Colors.white)
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      formatter.format(200),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .copyWith(fontSize: 30),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(
                            left: 14.0,
                            right: 14.0,
                            top: 10.0,
                            bottom: 5.0,
                          ),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: 14.0,
                                    right: 14.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    "LAST PAY DATE",
                                    style: Theme.of(context).textTheme.body2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      DateFormat.yMMMMEEEEd()
                                          .format(DateTime.now()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .copyWith(fontSize: 30),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(
                            left: 14.0,
                            right: 14.0,
                            top: 10.0,
                            bottom: 5.0,
                          ),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: 14.0,
                                    right: 14.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    "COMPLAINTS",
                                    style: Theme.of(context).textTheme.body2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            "TOTAL",
                                            style: Theme.of(context)
                                                .textTheme
                                                .title
                                                .copyWith(fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "10",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline
                                                  .copyWith(fontSize: 30),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        color: shedAppBlue400,
                                        width: .5,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            "OPEN",
                                            style: Theme.of(context)
                                                .textTheme
                                                .title
                                                .copyWith(fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "0",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline
                                                  .copyWith(fontSize: 30),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        color: shedAppBlue400,
                                        width: .5,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            "CLOSED",
                                            style: Theme.of(context)
                                                .textTheme
                                                .title
                                                .copyWith(fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "10",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline
                                                  .copyWith(fontSize: 30),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(
                            left: 14.0,
                            right: 14.0,
                            top: 10.0,
                            bottom: 5.0,
                          ),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 10.0,
                                    left: 14.0,
                                    right: 14.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    "PAYMENTS",
                                    style: Theme.of(context).textTheme.body2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "20",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline
                                          .copyWith(fontSize: 30),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 200, top: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, idx) {
                        return Card(
                          elevation: 1,
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: shedAppBlue100,
                              child: Text("DR"),
                              radius: 30,
                            ),
                            title: Text("Ayalegbe Rhoda"),
                            subtitle: Text("Sister"),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_forever,
                                color: shedAppBodyBlack,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: 20,
                    ),
                  ),
                )
              ],
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 200, top: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, idx) {
                        return Card(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 13,
                            ),
                            constraints: BoxConstraints(maxHeight: 100),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: shedAppBlue50,
                                        ),
                                      ),
                                      // SizedBox(height: 5,),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: shedAppYellow400,
                                                  width: 1)),
                                        ),
                                      ),
                                      // SizedBox(height: 5,),
                                      Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: shedAppErrorRed,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "${DateFormat.yMMMd().format(DateTime.now().subtract(Duration(days: 10)))}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Visited by Dirisu Rhoda",
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .title,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${DateFormat.yMMMd().format(DateTime.now())}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 20,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 3,
          spreadRadius: 2,
        )
      ]),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
