import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product{
  @HiveField(0)
  String name;

  @HiveField(1)
  String productId;

  @HiveField(2)
  double price;

  @HiveField(3)
  String description;

  // @HiveField(4)
  // String? imagePath;

  Product({
    required this.name,
    required this.productId,
    required  this.price,
    required this.description, 
    // required this.imagePath
  });
}

// class Product{
//   String name;
//   String productId;
//   double price;
//   String description;
//   //String? imagePath;
  
//   Product({
//     required this.name,
//     required this.productId,
//     required  this.price,
//     required this.description, 
//     //required this.imagePath
//   });
// }
