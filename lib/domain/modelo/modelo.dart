import 'package:flutter/cupertino.dart';
import 'package:helloeyesight/ui/pages/_camara.dart';
import 'package:helloeyesight/ui/pages/_scannerQrCb.dart';
import '../../ui/pages/_recordatorios.dart';

class Cliente {
  var nombre;
  var apellido;
  var telefono;
  Cliente({this.nombre, this.apellido, this.telefono});
}

List<Cliente> listaClientes = [
  Cliente(nombre: 'Socrates', apellido: 'Atenas', telefono: '11111'),
  Cliente(nombre: 'Platon', apellido: 'Atenas', telefono: '22222'),
  Cliente(nombre: 'Aristoteles', apellido: 'Atenas', telefono: '33333'),
  Cliente(nombre: 'Marco', apellido: 'Aurelio', telefono: '44444')
];

class Categoria {
  int id;
  String nameCategria;
  String nameImage;
  Widget nameRoute;

  Categoria(this.id, this.nameCategria, this.nameImage, this.nameRoute);
}

final Menu = [
  Categoria(1, "Camara", "face.png", Camara()),
  Categoria(2, "Recordatorios", "reminders.png", Recordatorio2()),
  Categoria(3, "Scanear Productos", "qr-barcode.png", Scanner()),
  Categoria(4, "Scannear Moneda", "money.png", Scanner()),
  Categoria(5, "Leer Texto", "read.png", Scanner()),
  Categoria(6, "Vestimena", "vestimenta.png", Scanner()),
];
