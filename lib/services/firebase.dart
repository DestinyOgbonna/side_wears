import 'package:building_ui/exports/exports.dart';

class FirebaseAuthService {
static FirebaseAuth? _firebaseAuth;

  getFirebaseInstance() {
    _firebaseAuth ??= FirebaseAuth.instance;
  }

  signInWithEmailAndPassword(
      {required String email, required String password}) async {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  createNewUser({required String email, required String password}) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  signOutUser(){
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return _firebaseAuth.signOut();
  }
}

final firebaseProvider = Provider((ref) {
  return FirebaseAuthService();
});
