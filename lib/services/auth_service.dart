import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentFirebaseUser => _auth.currentUser;

  Future<UserModel?> signUp({
    required String email,
    required String password,
    required String role,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user!.uid;

    final userModel = UserModel(
      uid: uid,
      email: email,
      role: role,
      createdAt: DateTime.now(),
    );

    await _firestore.collection('users').doc(uid).set(userModel.toMap());

    if (role == 'startup') {
      await _firestore.collection('startups').doc(uid).set({
        'uid': uid,
        'name': '',
        'description': '',
        'industry': '',
        'location': '',
        'employees': '',
        'verified': false,
        'createdAt': DateTime.now(),
      });
    } else {
      await _firestore.collection('students').doc(uid).set({
        'uid': uid,
        'name': '',
        'year': '',
        'skills': '',
        'bio': '',
        'createdAt': DateTime.now(),
      });
    }

    return userModel;
  }

  Future<UserModel?> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = credential.user!.uid;

    final doc = await _firestore.collection('users').doc(uid).get();

    if (!doc.exists) return null;

    return UserModel.fromMap(doc.data()!);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}