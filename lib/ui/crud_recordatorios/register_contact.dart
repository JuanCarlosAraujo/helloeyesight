//import 'package:helloeyesight/ui/pages/my_home_page.dart';
import 'package:helloeyesight/ui/pages/_recordatorios.dart';
import 'package:helloeyesight/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class RegisterContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<RegisterContact> {
  late TextEditingController controllerName;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerFecha;

  String get title => "Guarda Recordatorio";

  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerDescripcion = new TextEditingController();
    controllerFecha = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar Contactos"),
        ),
        body: ListView(
          children: [
            TextBox(controllerName, "Nombre del Recordatorio"),
            TextBox(controllerDescripcion, "Descricion"),
            TextBox(controllerFecha, "Fecha"),
            new SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  String name = controllerName.text;
                  String descripcion = controllerDescripcion.text;
                  String fecha = controllerFecha.text;

                  if (name.isNotEmpty && descripcion.isNotEmpty) {
                    Navigator.pop(
                      context,
                      new Recordatorio(
                          name: name, descripcion: descripcion, fecha: fecha),
                    );
                  }
                },
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Color.fromARGB(255, 150, 150, 150);
                      }
                      return Color.fromARGB(255, 31, 184, 255);
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
              ),
            ),
            /*
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.normal),
                ),
                onPressed: () {
                  String name = controllerName.text;
                  String descripcion = controllerDescripcion.text;
                  String fecha = controllerFecha.text;

                  if (name.isNotEmpty &&
                      descripcion.isNotEmpty &&
                      fecha.isNotEmpty) {
                    Navigator.pop(
                        context,
                        new Recordatorio(
                            name: name,
                            descripcion: descripcion,
                            fecha: fecha));
                  }
                },
                child: Text("Guardar Contacto")),*/
          ],
        ));
  }
}
