//import 'package:helloeyesight/ui/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:file_picker/file_picker.dart';
import 'dart:io';

<<<<<<< HEAD
//8
String sexo = "";
Map datosMapeados = {};

=======
>>>>>>> c2a8a3836fe1bad58aee47d163aa4c7b3f99cc70
class Camara extends StatefulWidget {
  const Camara({super.key});

  @override
  State<Camara> createState() => _Camara();
}

class _Camara extends State<Camara> {
  File? imagen = null;
  final picker = ImagePicker();

  Future selImagen(op) async {
    var pickedFile;

    if (op == 1) {
      // ignore: deprecated_member_use
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      // ignore: deprecated_member_use
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print('no se ha seleccionado una foto');
      }
    });
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selImagen(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Tomar una Foto',
                            style: TextStyle(fontSize: 16),
                          )),
                          Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selImagen(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.blue))),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Seleccionar una Foto',
                            style: TextStyle(fontSize: 16),
                          )),
                          Icon(
                            Icons.image,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.red),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Cancelar',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ruta de la Camara"),
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  opciones(context);
                },
                child: Text('Seleccione una imagen!'),
              ),
              SizedBox(
                height: 30,
              ),
              imagen != null ? Image.file(imagen!) : Center()
            ],
          ),
        )
      ]), //ada
    );
  }
}
