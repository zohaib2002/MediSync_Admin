import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:medisync/dashboard.dart';
import 'package:medisync/departmentScreen.dart';
import 'package:medisync/login.dart';
import 'package:medisync/register.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}

void main() {
  runApp(
    MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {

        '/': (context) => const Login(),
        '/register' : (context) => const Register(),
        '/dashboard' : (context) => const Dashboard(),
        '/department' : (context) => const DepartmentScreen(),

      },
    ),
  );
}

