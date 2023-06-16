import 'package:flutter/material.dart';
import 'package:helloeyesight/domain/modelo/modeloFaceRecognition.dart';
import 'package:helloeyesight/ui/pages/_camara.dart';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:helloeyesight/ui/pages/resultadosAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:camera/camera.dart';

FlutterTts flutterTts = FlutterTts();
FaceInfo infoFace = FaceInfo();
String billeteGenerado = "";
Map money = {};

class MoneyRecognition extends StatefulWidget {
  const MoneyRecognition({Key? key}) : super(key: key);

  @override
  _MoneyRecognition createState() => _MoneyRecognition();
}

class _MoneyRecognition extends State<MoneyRecognition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reconocimiento de billetes"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Billete(context),
            ]))
        //ada
        );
  }
}

Future<void> TraerResultadoBillete(BuildContext context) async {
  var response = await http.get(Uri.parse(
      "https://b792-181-78-11-206.ngrok-free.app/deteccion_billetes"));
  if (response.statusCode == 200) {
    Map jsonResponse = convert.jsonDecode(response.body);
    money = jsonResponse;
    if (money['money'] == null) {
      billeteGenerado = "no se ha detectado ningun billete";
    } else {
      billeteGenerado = money['money'];
    }
  }
}

Widget Billete(BuildContext context) {
  return Text("Es un billete de: ${billeteGenerado}",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}
