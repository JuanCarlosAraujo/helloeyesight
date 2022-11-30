//import 'package:helloeyesight/ui/pages/lista.dart';/
///import 'package:helloeyesight/reusable_widgets/reusable_widget.dart';
//import 'package:helloeyesight/ui/pages/_camara.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:helloeyesight/ui/pages/_recordatorios.dart';
//import 'package:helloeyesight/ui/pages/_scannerQrCb.dart';
import 'package:flutter/material.dart';
import 'package:helloeyesight/domain/modelo/modelo.dart';
import 'package:helloeyesight/ui/pages/login.dart';
import '../../utils/color_utils.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'package:helloeyesight/ui/pages/_camara.dart';
import 'package:flutter_tts/flutter_tts.dart';

//import 'package:audioplayers/audioplayers.dart';
FlutterTts flutterTts = FlutterTts();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

  static init() {}
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.exit_to_app_rounded, color: Colors.white70),
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SignInScreen()),
                ModalRoute.withName('/'))),
        title: Text("HelloeyeSight"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("F1F1F1"),
          hexStringToColor("EDEDED"),
          hexStringToColor("E9E9E9"),
          hexStringToColor("E5E5E5"),
          hexStringToColor("E1E1E1"),
          hexStringToColor("DDDDDD"),
          hexStringToColor("D9D9D9"),
          hexStringToColor("D5D5D5"),
          hexStringToColor("D1D1D1")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: GridView.builder(
          itemCount: Menu.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(10),
              height: 280.0,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Color(0xD1D1D1)
                  //color: Colors.white,
                  ),
              child: ElevatedButton(
                onPressed: () async {
                  speak("Abriendo ${Menu[index].nameCategria}");
                  if (Menu[index].id != 2 && Menu[index].id != 3) {
                    await availableCameras().then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Camara(
                            cameras: value,
                            index: Menu[index].id,
                          ),
                        ),
                      ),
                    );
                  } else if (Menu[index].id == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Menu[index].nameRoute));
                  } else if (Menu[index].id == 3) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Menu[index].nameRoute));
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/" + Menu[index].nameImage,
                      width: 85,
                    ),
                    Text(
                      Menu[index].nameCategria,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                      textScaleFactor: 1,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void speak(String texto) async {
  await flutterTts.setLanguage('es-US');
  await flutterTts.setPitch(1);
  await flutterTts.speak(texto);
}
