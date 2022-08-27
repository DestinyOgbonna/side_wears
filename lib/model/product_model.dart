import 'package:building_ui/exports/exports.dart';

class Product {
  final String? id;
  final String? productName;
  final String? productDescription;
  final num? productPrice;
  final List<String>? productImages;

  Product({
    this.id,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productImages,
  });

  factory Product.fromFirestore(
    QuerySnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.docs.map((doc) => doc.data()).toList();
    return Product(
      id: snapshot.docs.first.id,
      productName: snapshot.docs.first.data()['product_name'],
      productDescription: snapshot.docs.first.data()['product_description'],
      productPrice: snapshot.docs.first.data()['product_price'],
      productImages:snapshot.docs.first.data()[0]['product_images'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (productName != null) "product_name": productName,
      if (productPrice != null) "product_price": productPrice,
      if (productDescription != null) "product_description": productDescription,
      if (productImages != null) "product_image": productImages,
    };
  }
}
