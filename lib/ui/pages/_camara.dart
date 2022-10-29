//import 'package:helloeyesight/ui/pages/login.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io';
import 'resultadosAPI.dart';

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
    }
  }

  Future<void> CambiarVista() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ResultadosAPI()));
  }

  Future<void> MandarResultado(var imagen) async {
    var response = await http.post(
        Uri.parse("https://57ba-186-169-58-119.ngrok.io/proyectos%20php/datos"),
        body: {"imagen": imagen.toString()});
  }

  @override
  Widget build(BuildContext context) {
    CambiarVista();
    return Container();
  }
}
