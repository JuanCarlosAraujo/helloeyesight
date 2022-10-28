import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _ProviderMenu {
  _ProviderMenu() {
    loadData();
  }

  Future loadData() async {
    final value =
        await rootBundle.loadString('lib/assets/data/BarCodeProducts.json');
    Map<String, String> datos = json.decode(value);
    return datos;
  }

  void SearchProduct(Map datos) {}
}

final menuProvider = _ProviderMenu();
