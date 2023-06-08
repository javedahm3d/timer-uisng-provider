import 'package:abc/provider/extra_time_provider.dart';
import 'package:abc/provider/timer_provider.dart';
import 'package:abc/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider_timer/provider/timer_provider.dart';
// import 'package:provider_timer/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TimerProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ExtraTimerProvider(),
          )
        ],
        child: HomeScreen(),
      ),
      // home: ChangeNotifierProvider<TimerProvider>(
      //   create: (context) => TimerProvider(),
      //   child: HomeScreen(),
      // ),
    );
  }
}
