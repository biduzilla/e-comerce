import 'package:flutter/material.dart';

import 'pages/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(color: Colors.green),
          primaryColor: Colors.amber,
          indicatorColor: Colors.purple,
          scaffoldBackgroundColor: Color(0xff2B2D42),
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Color(0xffEF233C),
                onPrimary: Color(0xffEDF2F4),
                secondary: Colors.green,
              )),
      home: const HomeScreen(),
    );
  }
}
