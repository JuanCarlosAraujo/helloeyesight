import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io';

String sexo = "";
String emocion = "";
String edad = "";
String raza = "";
Map datosMapeados = {};

class ResultadosAPI extends StatefulWidget {
  const ResultadosAPI({super.key});

  @override
  State<ResultadosAPI> createState() => _ResultadosAPIState();
}

class _ResultadosAPIState extends State<ResultadosAPI> {
  // ignore: non_constant_identifier_names
  Future<void> TraerResultado() async {
    var response = await http.get(Uri.parse(
        "https://c654-186-169-62-198.ngrok.io/proyectos%20php/datos"));
    if (response.statusCode == 200) {
      Map jsonResponse = convert.jsonDecode(response.body);
      datosMapeados = jsonResponse;
      if (datosMapeados['genero'] == null) {
      } else {
        sexo = datosMapeados['genero'];
        edad = datosMapeados['edad'];
        emocion = datosMapeados['emocion'];
        raza = datosMapeados['raza'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TraerResultado();
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
              Raza(context)
            ])) //ada
        );
  }
}

Widget Sexo(BuildContext context) {
  return Text("SEXO: $sexo",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}

Widget Edad(BuildContext context) {
  return Text("EDAD: $edad",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}

Widget Emocion(BuildContext context) {
  return Text("EMOCION: $emocion",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}

Widget Raza(BuildContext context) {
  return Text("RAZA: $raza",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 53, 53, 53)));
}
