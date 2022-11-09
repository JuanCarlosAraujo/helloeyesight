import 'package:flutter/material.dart';
import 'package:helloeyesight/ui/crud_recordatorios/message_response.dart';
import 'package:helloeyesight/ui/crud_recordatorios/modify_contact.dart';
import 'package:helloeyesight/ui/crud_recordatorios/register_contact.dart';
import 'package:flutter/material.dart';

class Recordatorio2 extends StatefulWidget {
  //final String _title = 'asds';
  const Recordatorio2({super.key});
  // MyHomePage(this._title);
  @override
  State<StatefulWidget> createState() => _recordatorio();
}

class _recordatorio extends State<Recordatorio2> {
  List<Recordatorio> Recordatorios = [
    Recordatorio(name: '+++++++', descripcion: '------', fecha: '1969-07-20'),
    Recordatorio(name: '+++++++', descripcion: '------', fecha: '1969-07-20'),
    Recordatorio(name: '+++++++', descripcion: '------', fecha: '1969-07-20'),
    Recordatorio(name: '+++++++', descripcion: '------', fecha: '1969-07-20')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white70),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Recordatorios"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Recordatorios.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyContact(Recordatorios[index])))
                  .then((newContact) {
                if (newContact != null) {
                  setState(() {
                    Recordatorios.removeAt(index);

                    Recordatorios.insert(index, newContact);

                    messageResponse(
                        context, newContact.name + " a sido modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeRecordatorio(context, Recordatorios[index]);
            },
            title: Text(Recordatorios[index].name),
            subtitle: Text(Recordatorios[index].fecha),
            leading: CircleAvatar(
              child: Text(Recordatorios[index].name.substring(0, 1)),
            ),
            trailing: Icon(
              Icons.edit_calendar,
              color: Colors.blue,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterContact()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                Recordatorios.add(newContact);
                messageResponse(
                    context, newContact.name + " a sido guardado...!");
              });
            }
          });
        },
        tooltip: "Agregar Recordatorio",
        child: Icon(Icons.notification_add),
      ),
    );
  }

  removeRecordatorio(BuildContext context, Recordatorio Recordatorio) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Recordatorio"),
              content:
                  Text("Eliminara el Recordatorio " + Recordatorio.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.Recordatorios.remove(Recordatorio);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}

class Recordatorio {
  var name;
  var descripcion;
  var fecha;

  Recordatorio({this.name, this.descripcion, this.fecha});
}
