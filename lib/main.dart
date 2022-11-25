import 'package:firebase_core/firebase_core.dart';
import 'package:helloeyesight/ui/app.dart';
import 'package:flutter/material.dart';

//import 'package:crudclientes/ui/pages/usuario.dart'
void main() async {
  //usuario usuario1 = new usuario('qwerty', '12345');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}
