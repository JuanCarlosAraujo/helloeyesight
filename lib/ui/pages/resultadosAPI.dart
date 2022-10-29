import 'package:flutter/material.dart';
import 'package:helloeyesight/ui/pages/_faceRecognition.dart';

class ResultadosAPI extends StatefulWidget {
  const ResultadosAPI({super.key});

  @override
  State<ResultadosAPI> createState() => _ResultadosAPIState();
}

class _ResultadosAPIState extends State<ResultadosAPI> {
  // ignore: non_constant_identifier_names

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
