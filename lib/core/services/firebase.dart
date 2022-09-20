import 'package:building_ui/core/exports/exports.dart';

class FirebaseAuthService {
  final FirebaseAuth authService = FirebaseAuth.instance;

  signInWithEmailAndPassword(
      {required String email, required String password}) async {
    // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return authService.signInWithEmailAndPassword(
        email: email, password: password);
  }

  createNewUser({required String email, required String password}) {
    // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return authService.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  signOutUser() {
    // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return authService.signOut();
  }
}

final firebaseProvider = Provider((ref) {
  return FirebaseAuthService();
});
