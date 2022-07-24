import 'package:building_ui/exports/exports.dart';

class FirestoreCollectionService {
  
 // static CollectionReference? _firestoreCollectionRefernce;

 
  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');

// a new reference for adding to cart
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference cartRef =
      FirebaseFirestore.instance.collection('cart');

  
}
