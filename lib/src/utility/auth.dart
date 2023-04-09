import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../database/database_proxy.dart';
import 'config.dart';

abstract class AuthInterface {
  String? get currentUserId;

  Stream<String?> authStateChanges();

  Future<void> sendPasswordResetEmail({
    required String email,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class HiveAuth implements AuthInterface {
  final _controller = StreamController<String?>.broadcast();
  String? _currentUser;

  @override
  Stream<String?> authStateChanges() => _controller.stream;

  @override
  String? get currentUserId => _currentUser;

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    final box = await DatabaseProxy.getBox('auth');
    box.delete(email);
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final box = await DatabaseProxy.getBox('auth');
    await box.put(email, password);
    _currentUser = email;
    _controller.sink.add(email);
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final box = await DatabaseProxy.getBox('auth');
    if (box.get(email) == password) {
      _currentUser = email;
      _controller.sink.add(email);
    }
  }

  @override
  Future<void> signOut() async {
    _currentUser = null;
    _controller.sink.add(null);
  }
}

class FireAuth implements AuthInterface {
  final _controller = StreamController<String?>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  String? get currentUserId => _firebaseAuth.currentUser?.uid;

  @override
  Stream<String?> authStateChanges() =>
      _firebaseAuth.authStateChanges().map((user) => user?.uid);

  @override
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<void> sendPasswordResetEmail({
    required String email,
    ActionCodeSettings? actionCodeSettings,
  }) =>
      _firebaseAuth.sendPasswordResetEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<void> signOut() => _firebaseAuth.signOut();
}

class Auth {
  static final AuthInterface _auth = Config().isDemo ? HiveAuth() : FireAuth();

  static String? get currentUserId => _auth.currentUserId;

  static Stream<String?> get authStateChanges => _auth.authStateChanges();

  static Future<void> sendPasswordResetEmail({
    required String email,
  }) =>
      _auth.sendPasswordResetEmail(email: email);

  static Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  static Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _auth.createUserWithEmailAndPassword(email: email, password: password);

  static Future<void> signOut() => _auth.signOut();
}
