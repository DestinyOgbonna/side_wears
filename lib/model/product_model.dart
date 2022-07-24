import 'package:building_ui/exports/exports.dart';

class Product {
  final String? productName;
  final String? productDescription;
  final String? productPrice;
  final List<String>? productImages;

  Product({
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productImages,
  });

  factory Product.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Product(
      productName: data?['product_name'],
      productPrice: data?['product_price'],
      productDescription: data?['product_description'],
      productImages: data?['product_image'] is Iterable
          ? List.from(data?['product_image'])
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (productName != null) "product_name": productName,
      if (productPrice != null) "product_price": productPrice,
      if (productDescription != null) "product_description": productDescription,
      if (productImages != null) "product_image": productImages,
    };
  }
}
