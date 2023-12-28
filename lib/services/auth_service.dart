import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import '../models/custom_error.dart';

class AuthService {
  final FirebaseFirestore firebaseFirestore;
  final fb_auth.FirebaseAuth firebaseAuth;

  AuthService({required this.firebaseFirestore, required this.firebaseAuth});

  Stream<fb_auth.User?> get user => firebaseAuth.userChanges();

  // sign in method
  Future<void> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on fb_auth.FirebaseAuthException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(),
          code: 'Exception',
          plugin: 'ServerError: SignInWithEmailAndPassword');
    }
  }

  // sign up method
  Future<void> signUp(
      {required String name,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .set({
        'name': name,
        'lastName': lastName,
        'email': email,
        'createdAt': Timestamp.now(),
      });
    } on fb_auth.FirebaseAuthException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(),
          code: 'Exception',
          plugin: 'ServerError: SignUpWithEmailAndPassword');
    }
  }

  // sign out method
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on fb_auth.FirebaseAuthException catch (e) {
      throw CustomError(message: e.message!, code: e.code, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          message: e.toString(),
          code: 'Exception',
          plugin: 'ServerError: SignOut');
    }
  }
}
