import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/screen/about/about_screen.dart';
import 'package:la_vapiano/screen/home/provider/bottom_nav_provider.dart';
import 'package:la_vapiano/screen/must_login/must_login_screen.dart';
import 'package:la_vapiano/screen/shipping/shipping_screen.dart';
import 'package:la_vapiano/screen/table_slip/table_slip_screen.dart';
import 'package:la_vapiano/start/confirm_screen.dart';
import 'package:la_vapiano/start/login_screen.dart';
import 'package:la_vapiano/start/splash_screen.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        providers: [
          ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
           // colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
          ),
        home: const SplashScreen(),
      ),
    );
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //    // colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    //     useMaterial3: true,
    //   ),
    //   home:  MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
    //     ],
    //     child: const SplashScreen(),
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      ),
    );
  }
}
