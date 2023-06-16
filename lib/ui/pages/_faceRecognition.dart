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
Map datosMapeados = {};

class FaceRecognition extends StatefulWidget {
  const FaceRecognition({Key? key}) : super(key: key);

  @override
  _FaceRecognitionState createState() => _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ruta de la Camara"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Sexo(context),
              Edad(context),
              Emocion(context),
              Raza(context),
            ]))
        //ada
        );
  }
}

Future<void> TraerResultado(BuildContext context) async {
  var response = await http.get(Uri.parse(
      "https://b792-181-78-11-206.ngrok-free.app/reconocimiento_facial"));
  if (response.statusCode == 200) {
    Map jsonResponse = convert.jsonDecode(response.body);
    datosMapeados = jsonResponse;
    if (datosMapeados['genero'] == null) {
    } else {
      infoFace = new FaceInfo(
          genero: datosMapeados['genero'],
          edad: datosMapeados['edad'],
          emocion: datosMapeados['emocion'],
          raza: datosMapeados['raza']);
    }
  }

  ImprimirResultado();
}

void ImprimirResultado() {
  speak(
      'Rasgos de la persona, su sexo es; ${infoFace.genero}, su edad aproximada es; ${infoFace.edad}, su actual emoción es;' +
          '${infoFace.emocion}, su posible procedencia es; ${infoFace.raza}');
}

Widget Sexo(BuildContext context) {
  return Text("SEXO: ${infoFace.genero}",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}

Widget Edad(BuildContext context) {
  return Text("EDAD: ${infoFace.edad}",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}

Widget Emocion(BuildContext context) {
  return Text("EMOCION: ${infoFace.emocion}",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}

Widget Raza(BuildContext context) {
  return Text("RAZA: ${infoFace.raza}",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}

void speak(String texto) async {
  await flutterTts.setLanguage('es-US');
  await flutterTts.setPitch(1);
  await flutterTts.speak(texto);
}
