import 'package:flutter/material.dart';
import '../styles/colors.dart';

class OnboardingPage extends StatelessWidget {
  final ValueNotifier _activeSlide = ValueNotifier(0);
  OnboardingPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          PageView(
            onPageChanged: (val) => _activeSlide.value = val,
            children: <Widget>[
              SafeArea(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "Slide 1",
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "Slide 2",
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 50.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            "Slide 3",
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () => Navigator.of(context).pushReplacementNamed("auth"),
                        child: Text("Get Started"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30.0,
            child: ValueListenableBuilder(
              valueListenable: _activeSlide,
              builder: (context, val, child) {
                return DotIndicator(
                  itemCount: 3,
                  activeIndex: val,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final int itemCount;
  final int activeIndex;
  final Color inactiveColor;
  final Color activeColor;
  DotIndicator({
    this.itemCount = 3,
    this.activeIndex = 0,
    this.inactiveColor = Colors.black,
    this.activeColor = shedAppYellow300,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        itemCount,
        (it) {
          Color color = activeIndex == it ? activeColor : inactiveColor;
          return Container(
            margin: EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 5.0,
              backgroundColor: color,
            ),
          );
        },
      ),
    );
  }
}
