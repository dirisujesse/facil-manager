import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shed_app/components/app_spinner.dart';
import 'package:shed_app/mock/mock_payments.dart';
import 'package:shed_app/mock/mock_tenants.dart';
import 'package:shed_app/models/bill_model.dart';
import 'package:shed_app/models/property_model.dart';
import 'package:shed_app/models/tenant_model.dart';
import 'package:shed_app/pages/utilities_page.dart';
import 'package:shed_app/pages/notifications_page.dart';
import 'package:shed_app/styles/colors.dart';
import 'package:shed_app/styles/input_style.dart';

class FacilityDetailPage extends StatefulWidget {
  final PropertyModel facility;
  FacilityDetailPage({this.facility}) : assert(facility != null);
  @override
  State<StatefulWidget> createState() {
    return FacilityDetailPageState();
  }
}

class FacilityDetailPageState extends State<FacilityDetailPage>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabCtrl;
  NumberFormat formatter;
  final ValueNotifier showFloat = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 4, vsync: this);
    _tabCtrl.addListener(() {
      showFloat.value = _tabCtrl.index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    formatter = NumberFormat.currency(
        name: "NGN",
        symbol: "NGN ", //
        decimalDigits: 2,
        locale: Localizations.localeOf(context).toString());
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: ValueListenableBuilder(
        valueListenable: showFloat,
        builder: (context, val, child) {
          print(val);
          if (val) {
            return FloatingActionButton(
              heroTag: "createTenant",
              child: Icon(Icons.person_add),
              onPressed: () => "",
            );
          }
          return Container();
        },
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return [
            SliverAppBar(
              floating: false,
              pinned: true,
              leading: BackButton(
                color: Colors.white,
              ),
              title: Text(
                widget.facility.name.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .body2
                    .copyWith(color: Colors.white),
              ),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pushNamed('facilities/edit', arguments: widget.facility),
                )
              ],
              bottom: TabBar(
                isScrollable: true,
                controller: _tabCtrl,
                tabs: <Widget>[
                  Tab(
                    child: Text("TENANTS"),
                  ),
                  Tab(
                    child: Text("UTILITIES"),
                  ),
                  Tab(
                    child: Text("COMPLAINTS"),
                  ),
                  Tab(
                    child: Text("BILLS"),
                  ),
                ],
              ),
              backgroundColor: shedAppBlue400,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.facility.id,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                          widget.facility.picture,
                        ),
                        colorFilter: ColorFilter.mode(
                          Colors.black54,
                          BlendMode.darken,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            widget.facility.picture,
                          ),
                          radius: 100,
                        ),
                        Positioned(
                          top: 100.0,
                          left: 80.0,
                          child: Card(
                            color: shedAppYellow50.withOpacity(0.8),
                            elevation: 0,
                            shape: CircleBorder(),
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    widget.facility.apartments.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                          fontSize: 25.0,
                                        ),
                                  ),
                                  Text(
                                    "APARTMENTS",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          fontSize: 10.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100.0,
                          right: 90.0,
                          child: Card(
                            color: Colors.black.withOpacity(0.8),
                            shape: CircleBorder(),
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${((widget.facility.tenants.length / widget.facility.apartments) * 100).truncate()}%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                          fontSize: 25.0,
                                        ),
                                  ),
                                  Text(
                                    "FULL",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          fontSize: 10.0,
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 100.0,
                          left: 90.0,
                          child: Card(
                            color: Colors.white.withOpacity(0.8),
                            shape: CircleBorder(),
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "${widget.facility.tenants.length}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                          fontSize: 25.0,
                                        ),
                                  ),
                                  Text(
                                    "TENANTS",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          fontSize: 10.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 100,
                          right: 80,
                          child: Card(
                            color: shedAppYellow100.withOpacity(0.8),
                            elevation: 0,
                            shape: CircleBorder(),
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "0",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display1
                                        .copyWith(
                                          fontSize: 25.0,
                                        ),
                                  ),
                                  Text(
                                    "COMPLAINTS",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          fontSize: 10.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabCtrl,
          children: <Widget>[
            Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: searchInputStyle.copyWith(
                              hintText: "Search tenant by name",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.filter_list,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0,),
                    child: FutureBuilder(
                      future: getTenants(),
                      builder: (context, AsyncSnapshot<List<TenantModel>> res) {
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
                                  image:
                                      AssetImage('assets/img/no_messages.png'),
                                ),
                              ),
                            );
                          }
                          return ListView.separated(
                            itemCount: res.data.length,
                            itemBuilder: (context, idx) {
                              final TenantModel tenant = res.data[idx];
                              return ListTile(
                                onTap: () => Navigator.of(context).pushNamed("tenant/detail", arguments: tenant),
                                contentPadding: EdgeInsets.all(10.0),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(tenant.picture),
                                ),
                                title: Text(tenant.name),
                                subtitle: Text(
                                    "${tenant.phoneNumber}, ${tenant.email}"),
                                trailing: Container(
                                  decoration: BoxDecoration(
                                    color: (idx % 2) == 0
                                        ? shedAppBlue50
                                        : shedAppYellow100,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Text(
                                    (idx % 2) == 0 ? "PAID" : "DUE",
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 15.0),
                                ),
                              );
                            },
                            separatorBuilder: (context, idx) => Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                ),
                          );
                        } else {
                          return AppSpinner();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: searchInputStyle.copyWith(
                              hintText: "Search utilities by name",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.filter_list,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: UtilityList(),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: searchInputStyle.copyWith(
                              hintText: "Search messages by title",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.filter_list,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MessageList(),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: searchInputStyle.copyWith(
                              hintText: "Search bills by tenant name",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.filter_list,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0),
                    child: FutureBuilder(
                      future: getBills(),
                      builder: (context, AsyncSnapshot<List<BillModel>> res) {
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
                                  image:
                                      AssetImage('assets/img/no_messages.png'),
                                ),
                              ),
                            );
                          }
                          return ListView.separated(
                            itemCount: res.data.length,
                            itemBuilder: (context, idx) {
                              final BillModel bill = res.data[idx];
                              return Card(
                                elevation: 0,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              tenants[idx].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline
                                                  .copyWith(fontSize: 25),
                                            ),
                                          ),
                                          Text(
                                            idx % 2 != 0 ? "OVERDUE" : "PAID",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                .copyWith(
                                                  color: idx % 2 != 0
                                                      ? shedAppErrorRed
                                                      : Colors.green,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${bill.utility.name} Bill",
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        formatter.format(bill.utility.cost),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline
                                            .copyWith(fontSize: 50),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "Period Covered: ${DateFormat.yMMMM().format(bill.period)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1,
                                      ),
                                      Text(
                                        "Due Date: ${DateFormat.yMMMMEEEEd().format(bill.dueDate)}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1,
                                      ),
                                      SizedBox(
                                        height: idx % 2 != 0 ? 10.0 : 0,
                                      ),
                                      idx % 2 != 0
                                          ? FlatButton(
                                              child: Text("SEND REMINDER"),
                                              onPressed: () => "",
                                            )
                                          : SizedBox(
                                              height: 0,
                                            )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, idx) => Container(
                                  height: 0.5,
                                  color: Colors.grey,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                ),
                          );
                        } else {
                          return AppSpinner();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
