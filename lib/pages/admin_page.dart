import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shopsift/models/boxes.dart';

import '../models/product.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;


    TextEditingController nameController = TextEditingController();
    TextEditingController productIdController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    // Getting the screen size for dynamic sizing


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'A D M I N',
          style: TextStyle(
            fontSize: screenSize.width * 0.05, // Adjust font size dynamically
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenSize.width * 0.03),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to Shop once upload , editing or deletion is done
                Navigator.of(context).pushReplacementNamed('/homepage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenSize.width * 0.02), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenSize.height * 0.01,
                  horizontal: screenSize.width * 0.05,
                ), // Dynamic padding
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * 0.04, // Dynamic text size
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.05), // Dynamic padding
          child: Column(
            children: [
              
                  Container(
                    height: screenSize.height * 0.4,
                    decoration: BoxDecoration(
                  
                      color: Theme.of(context).colorScheme.primary, // Use the primary color from the theme
                      borderRadius: BorderRadius.circular(16.0), // Rounded corners
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary, // Border color from the theme
                        width: 4.0,
                      ),
                    ),
                    child:Padding(
                      padding:EdgeInsets.all(screenSize.width * 0.05), 
                      child:Container(
                
                  child:Column(
                    
                    children: <Widget>[

                    //Text Field for entering name of product
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.all(screenSize.width * 0.05),
                        border: OutlineInputBorder(),
                        hintText : 'Product Name'
                      )
                    ),
//SizedBox(height: screenSize.width * 0.015), 
                    //Text Field for entering ProductId
                    TextField(
                      controller: productIdController,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.all(screenSize.width * 0.05),
                        border: OutlineInputBorder(),
                        hintText : 'Product Id'
                      )
                    ),
//SizedBox(height: screenSize.width * 0.015), 
                    //Text Field for entering price of product
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration:  InputDecoration(
                        // contentPadding: EdgeInsets.all(screenSize.width * 0.05),
                        border: OutlineInputBorder(),
                        hintText : 'Product Price'
                      )
                    ),
//SizedBox(height: screenSize.width * 0.015), 
                    //Text Field for entering description of the product
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.all(screenSize.width * 0.05),
                        border: OutlineInputBorder(),
                        hintText : 'Product Description'
                      )
                    ),
//SizedBox(height: screenSize.width * 0.015), 
                    //Button to add Image using image picker 



//SizedBox(height: screenSize.width * 0.015), 
                    //Add button to Submit the product details into the box
                    TextButton(
                      onPressed: (){
                        setState(() {
                          boxProducts.put(
                            'key_${productIdController.text}',
                            Product(
                              name: nameController.text,
                              productId: productIdController.text, 
                              price: double.parse((double.tryParse(priceController.text) ?? 0.0).toStringAsFixed(2)),
                              description: descriptionController.text, 
                              //imagePath: imagePath.text,
                          )
                        );
                      });
                    },
                      child: const Text('Add',style:TextStyle(color: Colors.green)),),
                    


//SizedBox(height: screenSize.width * 0.015), 
                  ],

                )
                )
                )
                ),
Expanded(
  child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        //TODO ListView.builder
        child: ListView.builder(
          itemCount: boxProducts.length, // Adjust this based on your data
          itemBuilder: (context, index) {
            // Fetch data for the current item
            //TODO : .getAt
            Product product = boxProducts.getAt(index); 

            return Card(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                // leading: Image.network(
                //   product.imageUrl, // Assuming each product has an imageUrl property
                //   width: 50, // Adjust width to your preference
                //   height: 50, // Adjust height to your preference
                //   fit: BoxFit.cover, // Ensure image fits within the bounds
                // ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Product ID: ${product.productId}'),
                    Text('Price: \$${product.price.toString()}'),
                    Text('Description: ${product.description}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Perform edit action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // Perform delete action
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  ),
)

              
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     theme: ThemeData(
//       appBarTheme: AppBarTheme(
//         backgroundColor: Colors.blueAccent, // Set your app bar color here
//       ),
//     ),
//     home: AdminPage(),
//     routes: {
//       '/nextPage': (context) => NextPage(), // Define your route here
//     },
//   ));
// }

// class NextPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Next Page'),
//       ),
//       body: Center(
//         child: Text('This is the next page.'),
//       ),
//     );
//   }
// }