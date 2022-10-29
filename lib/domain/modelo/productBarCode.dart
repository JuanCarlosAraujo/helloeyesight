import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ProviderMenu {
  var nombreProducto;
  var precioProducto;

  ProviderMenu() {}

  Future loadData(var codigo) async {
    final value =
        await rootBundle.loadString('lib/assets/data/BarCodeProducts.json');
    List<dynamic> jsonResponse = jsonDecode(value);
    for (var item in jsonResponse) {
      if (item['Codigo'] == codigo) {
        nombreProducto = item['Producto'];
        precioProducto = item['Valor'];
        print(nombreProducto);
        print(precioProducto);
      }
    }
  }
}
