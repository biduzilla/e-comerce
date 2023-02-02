import 'package:e_comerce/pages/cart/cart_screen.dart';
import 'package:e_comerce/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<HomeStore>(
      create: (context) => HomeStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff2B2D42),
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Color(0xffEF233C),
                  onPrimary: Color(0xffEDF2F4),
                )),
        home: const HomeScreen(),
      ),
    );
  }
}
