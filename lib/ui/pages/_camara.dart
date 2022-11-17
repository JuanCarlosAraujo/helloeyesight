import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:helloeyesight/ui/pages/_faceRecognition.dart';
import 'package:helloeyesight/ui/pages/_textRecognition.dart';

File? imagen = null;
int id = 0;

class Camara extends StatefulWidget {
  final List<CameraDescription>? cameras;
  final index;
  const Camara({this.cameras, this.index, Key? key}) : super(key: key);
  @override
  State<Camara> createState() => _Camara();
}

class _Camara extends State<Camara> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.low,
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
          .then((value) => CambiarVista());
    }
  }

  void CambiarVista() {
    if (widget.index == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FaceRecognition()));
    } else if (widget.index == 5) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TextRecognition()));
    }
  }

  Future<void> EnviarImagen(var imagen) async {
    String data = imagen.toString();
    var response = await http.post(
        Uri.parse("https://0472-181-78-11-206.ngrok.io/imagen"),
        body: {"data": data});
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
