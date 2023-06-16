import 'package:flutter/material.dart';
import 'package:helloeyesight/domain/modelo/respTextAPI.dart';
import 'package:helloeyesight/ui/pages/_camara.dart';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:camera/camera.dart';

FlutterTts flutterTts = FlutterTts();
Respuesta respuesta = Respuesta();
Map datosMapeados = {};

class TextRecognition extends StatefulWidget {
  const TextRecognition({super.key});

  @override
  State<TextRecognition> createState() => _TextRecognitionState();
}

class _TextRecognitionState extends State<TextRecognition> {
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
              Texto(context),
            ]))
        //ada
        );
  }
}

Future<void> TraerResultadoDelTexto(BuildContext context) async {
  var response = await http.get(Uri.parse(
      "https://e2bb-181-78-11-206.ngrok-free.app/reconocimiento_texto"));
  if (response.statusCode == 200) {
    Map jsonResponse = convert.jsonDecode(response.body);
    datosMapeados = jsonResponse;
    if (datosMapeados['text'] == null) {
      respuesta = new Respuesta(texto: "error, intente nuevamente");
    } else {
      respuesta = new Respuesta(texto: datosMapeados['text']);
    }
  }

  ImprimirResultado();
}

void ImprimirResultado() {
  speak(respuesta.texto);
}

Widget Texto(BuildContext context) {
  return Text("Texto: ${respuesta.texto}",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}

void speak(String texto) async {
  await flutterTts.setLanguage('es-US');
  await flutterTts.setPitch(1);
  await flutterTts.speak(texto);
}
