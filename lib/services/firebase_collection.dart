import 'package:building_ui/exports/exports.dart';

class FirestoreCollectionService {
  
 // static CollectionReference? _firestoreCollectionRefernce;

 
  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection('Products');

// a new reference for adding to cart
  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('Users');

  
}
