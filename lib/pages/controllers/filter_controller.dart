import 'package:flutter/material.dart';

final filterController = FilterController();

class FilterController extends ChangeNotifier {
  String dropdownValue1 = 'Fuzil';
  String dropdownValue2 = 'produto';
  String searchValue = '';

  void categorias(String valor) {
    dropdownValue1 = valor;
    notifyListeners();
  }

  void filtrar(String valor) {
    dropdownValue2 = valor;
    notifyListeners();
  }

  void search(String valor) {
    searchValue = valor;
    notifyListeners();
  }
}
