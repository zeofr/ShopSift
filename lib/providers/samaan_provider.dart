import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/samaan.dart';

class SamaanProvider with ChangeNotifier {
  final Box<Samaan> samaanBox;

  SamaanProvider(this.samaanBox);

  List<Samaan> get samaanList => samaanBox.values.toList();

  void addSamaan(Samaan samaan) {
    samaanBox.add(samaan);
    notifyListeners();
  }

  void editSamaan(int index, Samaan updatedSamaan) {
    samaanBox.putAt(index, updatedSamaan);
    notifyListeners();
  }

  void deleteSamaan(int index) {
    samaanBox.deleteAt(index);
    notifyListeners();
  }
}

