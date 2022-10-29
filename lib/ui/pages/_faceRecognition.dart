import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:helloeyesight/domain/modelo/modeloFaceRecognition.dart';
import 'package:helloeyesight/ui/pages/resultadosAPI.dart';
import 'dart:convert' as convert;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';

File? imagen = null;
FaceInfo infoFace = FaceInfo();
Map datosMapeados = {};

class FaceRecognition extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const FaceRecognition({this.cameras, Key? key}) : super(key: key);

  @override
  _FaceRecognitionState createState() => _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> CapturarImagen() async {
    var image = await controller.takePicture();
    if (image != null) {
      var imagen = File(image.path);
      EnviarImagen(convert.base64Encode(imagen.readAsBytesSync()))
          .whenComplete(() => TraerResultado());
      await TraerResultado().then((value) => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResultadosAPI())));
    }
  }

  Future<void> EnviarImagen(var imagen) async {
    var response = await http.post(
        Uri.parse(
            "https://57ba-186-169-58-119.ngrok.io/proyectos%20php/imagen"),
        body: {"imagen": imagen.toString()});
  }

  Future<void> TraerResultado() async {
    var response = await http.get(Uri.parse(
        "https://57ba-186-169-58-119.ngrok.io/proyectos%20php/datos"));
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
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(controller),
          GestureDetector(
            onTap: () {
              CapturarImagen();
            },
          )
        ],
      ),
    );
  }
}
