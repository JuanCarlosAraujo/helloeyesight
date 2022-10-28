//import 'package:helloeyesight/ui/pages/login.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io';

String sexo = "";
Map datosMapeados = {};

class Camara extends StatefulWidget {
  const Camara({super.key});

  @override
  State<Camara> createState() => _Camara();
}

class _Camara extends State<Camara> {
  File? imagen = null;
  final picker = ImagePicker();

  Future selImagen() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      var imagen = File(image.path);
      MandarResultado(convert.base64Encode(imagen.readAsBytesSync()));
      TraerResultado();
    }
  }

  Future<void> MandarResultado(var imagen) async {
    var response = await http.post(
        Uri.parse("http://192.168.5.190/proyectos%20php/imagen"),
        body: {"imagen": imagen.toString()});
  }

  Future<void> TraerResultado() async {
    var response =
        await http.get(Uri.parse("http://192.168.5.190/proyectos%20php/datos"));
    if (response.statusCode == 200) {
      Map jsonResponse = convert.jsonDecode(response.body);
      datosMapeados = jsonResponse;
      if (datosMapeados['genero'] == null) {
      } else {
        sexo = datosMapeados['genero'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    selImagen();
    return Scaffold(
        appBar: AppBar(
          title: Text("Ruta de la Camara"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text(sexo), confirmar(context)])) //ada
        );
  }

  Widget confirmar(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
        onPressed: () {
          setState(() {});
        },
        child: Text("confirmar"));
  }
}
