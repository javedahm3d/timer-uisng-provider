import 'package:abc/demo_page.dart';
import 'package:abc/provider/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider_timer/provider/timer_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var timer;
  var Extratimer;
  int? sec, min, hr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Provider.of<TimerProvider>(context, listen: false);
    // Extratimer = Provider.of<ExtraTimerProvider>(context, listen: false);
    timer.setVars(0, 0, 5);

    // print(context.watch<TimerProvider>().minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: homeScreenBody(),
    );
  }

  Widget homeScreenBody() {
    return Column(
      children: [
        Container(child: Consumer<TimerProvider>(
          builder: (context, timeprovider, widget) {
            return Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    '${timer.hour} : ' +
                        '${timer.minute} : ' +
                        '${timer.seconds} ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                ),
                // timer.minute == 0 ? Extratimer.startTimer : null,
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    (timer.startEnable)
                        ? ElevatedButton(
                            onPressed: () {
                              timer.startTimer(0, 0, 5);
                            },
                            child: Text('Start'),
                          )
                        : (timer.stopEnable)
                            ? ElevatedButton(
                                onPressed: timer.stopTimer,
                                child: Text('stop'),
                              )
                            : ElevatedButton(
                                onPressed: timer.continueTimer,
                                child: Text('continue'),
                              ),

                    // (timer.stopEnable)
                    //     ? ElevatedButton(
                    //         onPressed: timer.stopTimer,
                    //         child: Text('Stop'),
                    //       )
                    //     : ElevatedButton(
                    //         onPressed: null,
                    //         child: Text('start'),
                    //       ),
                    // (timer.continueEnable)
                    //     ? ElevatedButton(
                    //         onPressed: timer.continueTimer,
                    //         child: Text('Continue'),
                    //       )
                    //     : ElevatedButton(
                    //         onPressed: null,
                    //         child: Text('Continue'),
                    //       ),
                  ],
                ),
              ],
            );
          },
        )),
        Container(child: Consumer<TimerProvider>(
          builder: (context, timeprovider, widget) {
            return Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    '${timer.Extrahour} : ' +
                        '${timer.Extraminute} : ' +
                        '${timer.Extraseconds} ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DemoPage(),
                      ));
                    },
                    child: Text('next page'))
              ],
            );
          },
        ))
      ],
    );
  }
}
