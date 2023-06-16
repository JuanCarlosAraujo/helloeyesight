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
String objetoGenerado = "";
Map objeto = {};

class ObjetsRecognition extends StatefulWidget {
  const ObjetsRecognition({Key? key}) : super(key: key);

  @override
  _ObjetsRecognition createState() => _ObjetsRecognition();
}

class _ObjetsRecognition extends State<ObjetsRecognition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reconocimiento de objetos"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Objeto(context),
            ]))
        //ada
        );
  }
}

Future<void> TraerResultadoObjeto(BuildContext context) async {
  var response = await http.get(
      Uri.parse("https://e2bb-181-78-11-206.ngrok-free.app/deteccion_objetos"));
  if (response.statusCode == 200) {
    Map jsonResponse = convert.jsonDecode(response.body);
    objeto = jsonResponse;
    if (objeto['objeto'] == null) {
      objetoGenerado = "no se ha detectado ningun objeto";
    } else {
      objetoGenerado = objeto['objeto'];
    }
  }
}

Widget Objeto(BuildContext context) {
  return Text("el objeto es: ${objetoGenerado}",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}
