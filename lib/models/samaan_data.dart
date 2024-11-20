import 'package:flutter/material.dart';

import 'samaan.dart';

class SamaanData extends ChangeNotifier{
  //list ALL data
    List<Samaan> samaanList = [
    Samaan(
        naam: 'Product 1',
        samaanId: '001',
        daam: 99.99,
        soochna:
            'Item description... more description to describe the product more info here will look like this',
        imagePath: 'lib/Test/test_image1.jpg'),
    Samaan(
        naam: 'Product 2',
        samaanId: '002',
        daam: 49.99,
        soochna: 'Another product description.',
        imagePath: 'lib/Test/test_image2.png'),
    Samaan(
        naam: 'Product 3',
        samaanId: '003',
        daam: 29.99,
        soochna: 'More info about product.',
        imagePath: 'lib/Test/image3.jpg'),
  ];
  //get ALL data
  List<Samaan> getAllSamaanList(){
    return samaanList;
  }

  //add data 
  void _addSamaan(Samaan newSamaan) {
    samaanList.add(newSamaan);
  }
  //edit data 
  void _editSamaan(Samaan toBeEditedSamaan) {
    samaanList.add(toBeEditedSamaan);
  //delete data
    void _deleteSamaan(Samaan toBeDeletedSamaan) {
    samaanList.add(toBeDeletedSamaan);
    }

}}