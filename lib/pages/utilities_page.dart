import 'package:flutter/material.dart';
import 'package:shed_app/components/app_scaffold.dart';
import 'package:shed_app/mock/mock_utility.dart';

import 'package:shed_app/components/app_spinner.dart';
import 'package:shed_app/styles/colors.dart';

class UtilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        heroTag: "createUtility",
        tooltip: "Create Utility",
        onPressed: () => Navigator.of(context).pushNamed('utilities/create'),
      ),
      child: UtilityList(),
      pageTitle: ValueNotifier("UTILITIES"),
    );
  }
}

class UtilityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUtilities(),
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
          return ListView.separated(
            padding: EdgeInsets.all(0),
            itemCount: res.data.length,
            itemBuilder: (context, idx) {
              final it = res.data[idx];
              return ListTile(
                title: Text(it.name, style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16),),
                subtitle: Text(it.description),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("NGN ${it.cost}", style: Theme.of(context).textTheme.body2),
                    SizedBox(
                      height: 5.0,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: shedAppYellow400,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          "EDIT",
                          style: Theme.of(context)
                              .textTheme
                              .body1,
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                      ),
                      onTap: () => Navigator.of(context)
                          .pushNamed("utilities/edit/${it.id}"),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, idx) => Container(
                  height: 0.5,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(horizontal: 14.0),
                ),
          );
        } else {
          return AppSpinner();
        }
      },
    );
  }
}
