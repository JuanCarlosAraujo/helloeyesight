import 'package:flutter/material.dart';
import 'package:helloeyesight/ui/crud_recordatorios/message_response.dart';
import 'package:helloeyesight/ui/crud_recordatorios/modify_contact.dart';
import 'package:helloeyesight/ui/crud_recordatorios/register_contact.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

stt.SpeechToText speech = stt.SpeechToText();
bool available = false;
String resultado = "";

class Recordatorio2 extends StatefulWidget {
  //final String _title = 'asds';
  const Recordatorio2({super.key});
  // MyHomePage(this._title);
  @override
  State<StatefulWidget> createState() => _recordatorio();
}

class _recordatorio extends State<Recordatorio2> {
  List<Recordatorio> Recordatorios = [];

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
        onPressed: () async {
          available = await speech.initialize();
          if (speech.isNotListening) {
            speech.listen(onResult: Resultado, partialResults: false);
          } else {
            speech.stop();
            print("makingvoice");
          }
          GuardarRecordatorios();
        },
        tooltip: "Agregar Recordatorio por medio de voz",
        child: Icon(Icons.mic),
      ),
    );
  }

  void Resultado(SpeechRecognitionResult result) {
    setState(() {
      resultado = result.recognizedWords;
    });
  }

  Future<void> GuardarRecordatorios() async {
    await Future.delayed(Duration(seconds: 7));
    String hora = "";
    hora = resultado.split(" las ")[1];
    if (resultado != null) {
      Recordatorio recordatorio =
          Recordatorio(name: resultado, descripcion: "-", fecha: hora);
      setState(() {
        Recordatorios.add(recordatorio);
        messageResponse(context, resultado + " a sido guardado...!");
      });
    }
  }

  Future ResultListener() async {
    resultado = await speech.lastRecognizedWords;
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
