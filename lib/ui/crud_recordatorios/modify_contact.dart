import 'package:flutter/material.dart';
import 'package:helloeyesight/reusable_widgets/reusable_widget.dart';
import 'package:helloeyesight/ui/pages/_recordatorios.dart';

class ModifyContact extends StatefulWidget {
  final Recordatorio _recordatorio;
  ModifyContact(this._recordatorio);
  @override
  State<StatefulWidget> createState() => _ModifyContact();
}

class _ModifyContact extends State<ModifyContact> {
  late TextEditingController controllerName;
  late TextEditingController controllerDescripcion;
  late TextEditingController controllerFecha;

  @override
  void initState() {
    Recordatorio c = widget._recordatorio;
    controllerName = new TextEditingController(text: c.name);
    controllerDescripcion = new TextEditingController(text: c.descripcion);
    controllerFecha = TextEditingController(text: c.fecha);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.notifications, color: Colors.white70),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Modificar Recordatorio"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Nombre del Recordatorio"),
          TextBox(controllerDescripcion, "Descripcion"),
          TextBox(controllerFecha, "Fecha"),
          ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String surname = controllerDescripcion.text;
                String fecha = controllerFecha.text;

                if (name.isNotEmpty && surname.isNotEmpty && fecha.isNotEmpty) {
                  Navigator.pop(
                      context,
                      new Recordatorio(
                          name: name, descripcion: surname, fecha: fecha));
                }
              },
              child: Text("Guardar Recordatorio")),
        ],
      ),
    );
  }
}
