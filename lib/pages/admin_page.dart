import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import '../components/custom_appbar.dart';
import '../components/custom_drawer.dart';
import '../models/samaan.dart';
import '../providers/samaan_provider.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController naamController = TextEditingController();
  final TextEditingController samaanIdController = TextEditingController();
  final TextEditingController daamController = TextEditingController();
  final TextEditingController soochnaController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _clearDialogFields() {
    naamController.clear();
    samaanIdController.clear();
    daamController.clear();
    soochnaController.clear();
    _image = null;
  }

  void _showAddSamaanDialog({int? index}) {
    final samaanProvider = Provider.of<SamaanProvider>(context, listen: false);

    if (index != null) {
      final product = samaanProvider.samaanList[index];
      naamController.text = product.naam;
      samaanIdController.text = product.samaanId;
      daamController.text = product.daam.toString();
      soochnaController.text = product.soochna;
      _image = File(product.imagePath);
    } else {
      _clearDialogFields();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Add Product' : 'Edit Product'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: naamController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: samaanIdController,
                  decoration: InputDecoration(labelText: 'Product ID'),
                ),
                TextField(
                  controller: daamController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: soochnaController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 10),
                _image == null
                    ? Text('No image selected.')
                    : Column(
                        children: [
                          Image.file(_image!, height: 100),
                          Text('Image Selected'),
                        ],
                      ),
                ElevatedButton(
                    onPressed: _pickImage, child: Text('Pick Image')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final samaan = Samaan(
                  naam: naamController.text,
                  samaanId: samaanIdController.text,
                  daam: double.tryParse(daamController.text) ?? 0.0,
                  soochna: soochnaController.text,
                  imagePath: _image?.path ?? '',
                );

                if (index == null) {
                  samaanProvider.addSamaan(samaan);
                } else {
                  samaanProvider.editSamaan(index, samaan);
                }

                _clearDialogFields(); // Clear fields after saving
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final samaanProvider = Provider.of<SamaanProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),
      endDrawer: CustomDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: samaanProvider.samaanList.asMap().entries.map((entry) {
            int index = entry.key;
            Samaan product = entry.value;
            return SamaanCard(
              product: product,
              onEdit: () => _showAddSamaanDialog(index: index),
              onDelete: () => samaanProvider.deleteSamaan(index),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSamaanDialog(),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent, 
        shape: CircularNotchedRectangle(), // Provides a notch for a floating action button
        notchMargin: 8.0,
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.01,
              horizontal: MediaQuery.of(context).size.width * 0.01),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.2),
          ),
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              child: Text(
                'Save',
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/shoppage');
            },
          ),
        ),
      ),
    );
  }
}

class SamaanCard extends StatelessWidget {
  final Samaan product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  SamaanCard({
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.imagePath.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.file(
                          File(product.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Icon(Icons.image_not_supported_outlined),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.naam,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        product.soochna,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.daam}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: onEdit,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: onDelete,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
