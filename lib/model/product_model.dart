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
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    return Product(
      id: snapshot.id,
      productName: snapshot.data()['product_name'],
      productDescription: snapshot.data()['product_description'],
      productPrice: snapshot.data()['product_price'],
      productImages: snapshot.data()['product_images'] == null
          ? null
          : snapshot.data()['product_images'][0],
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
