import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final auth = FirebaseAuth.instance;

class AuthHandler extends GetxService {
  static signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (e) {
      print('error');
    }
  }

  static signOut() {
    auth.signOut();
    try {} on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (e) {
      print('error');
    }
  }
}
