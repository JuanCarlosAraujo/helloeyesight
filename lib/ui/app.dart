//import 'package:helloeyesight/domain/modelo/modelo.dart';
import 'package:helloeyesight/ui/pages/home.dart';
import 'package:helloeyesight/ui/pages/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HelloeyeSight',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
