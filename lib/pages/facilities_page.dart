import 'package:flutter/material.dart';
import 'package:shed_app/components/app_scaffold.dart';
import 'package:shed_app/components/app_spinner.dart';
import 'package:shed_app/mock/mock_facilities.dart';
import 'package:shed_app/models/property_model.dart';
import 'package:shed_app/styles/colors.dart';

class FacilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: FutureBuilder(
        future: getFacilities(),
        builder: (context, res) {
          print(res);
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
            return Container(
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                itemCount: res.data.length,
                itemBuilder: (context, idx) {
                  final PropertyModel it = res.data[idx];
                  return GestureDetector(
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: shedAppBlue50, width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.0,
                              vertical: 14.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(color: shedAppBlue50, width: 1),
                              ),
                            ),
                            child: Table(
                              children: <TableRow>[
                                TableRow(
                                  children: [
                                    Text(
                                      it.name,
                                      style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16),
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${it.city}, ${it.country}",
                                      textAlign: TextAlign.right,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 5 / 2,
                            child: Hero(
                              tag: it.id,
                              child: Image.asset(
                                it.picture,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            // padding: EdgeInsets.symmetric(
                            //   horizontal: 14.0,
                            //   vertical: 14.0,
                            // ),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: shedAppBlue50, width: 1),
                              ),
                            ),
                            child: Table(
                              children: <TableRow>[
                                TableRow(
                                  children: [
                                    FlatButton.icon(
                                      icon: Icon(
                                        Icons.supervisor_account,
                                        color: shedAppBlue300,
                                      ),
                                      label: Text(
                                        it.tenants.length.toString(),
                                        style:
                                            Theme.of(context).textTheme.body2,
                                      ),
                                      onPressed: () => "",
                                    ),
                                    FlatButton.icon(
                                      icon: Icon(
                                        Icons.local_hotel,
                                        color: shedAppBlue300,
                                      ),
                                      label: Text(
                                        it.apartments.toString(),
                                        style:
                                            Theme.of(context).textTheme.body2,
                                      ),
                                      onPressed: () => "",
                                    ),
                                    FlatButton.icon(
                                      icon: Icon(
                                        Icons.battery_unknown,
                                        color: shedAppBlue300,
                                      ),
                                      label: Text(
                                        "${((it.tenants.length / it.apartments) * 100).truncate()}%",
                                        style:
                                            Theme.of(context).textTheme.body2,
                                      ),
                                      onPressed: () => "",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => Navigator.of(context)
                        .pushNamed('facilities/detail/${it.id}'),
                  );
                },
              ),
            );
          } else {
            return AppSpinner();
          }
        },
      ),
      pageTitle: ValueNotifier("FACILITIES"),
    );
  }
}
