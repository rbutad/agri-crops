import 'package:agricrops/enums/auth_status_enum.dart';
import 'package:agricrops/enums/user_status_enum.dart';
import 'package:agricrops/models/signup/signup.dart';
import 'package:agricrops/models/user/app_user.dart';
import 'package:agricrops/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final UserService _userService;

  late User? _user;
  User? get user => _user;

  late AppUser? _appUser;
  AppUser? get appUser => _appUser;

  AuthStatus _authStatus = AuthStatus.uninitialized;
  AuthStatus get authStatus => _authStatus;

  String _displayName = '';
  String get displayName => _displayName;

  String _authErrorMsg = '';
  String get authErrorMsg => _authErrorMsg;

  AuthProvider(this._firebaseAuth, this._userService) {
    _firebaseAuth.authStateChanges().listen(_onStateChanged);
  }

  Future<void> _onStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _user = null;
      _appUser = null;
      _displayName = '';
      _authStatus = AuthStatus.unauthenticated;

      notifyListeners();
    } else {
      _userService
          .getUser(firebaseUser.uid)
          .map((document) => AppUser.fromDocument(document))
          .listen((appUser) {
        _onAppUserStateChanged(appUser, firebaseUser);
      });
    }
  }

  Future<void> _onAppUserStateChanged(
      AppUser appUser, User firebaseUser) async {
    switch (appUser.status) {
      case UserStatus.pending:
        _authErrorMsg =
            'Your account is not yet approved by your association.\n\nPlease contact the admin of your association.';
        _authStatus = AuthStatus.authError;

        notifyListeners();
        break;
      case UserStatus.declined:
        _authErrorMsg =
            'Your account has been declined by your association.\n\nPlease contact the admin of your association to know more.';
        _authStatus = AuthStatus.authError;

        notifyListeners();
        break;
      default:
        _appUser = appUser;

        _user = firebaseUser;
        _authStatus = AuthStatus.authenticated;

        notifyListeners();
        break;
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      _authStatus = AuthStatus.authenticating;
      notifyListeners();

      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> createAccount(SignUp signUp) async {
    FirebaseApp app = await Firebase.initializeApp(
      name: 'AgriCrops_user',
      options: Firebase.app().options,
    );

    try {
      final account = await FirebaseAuth.instanceFor(app: app)
          .createUserWithEmailAndPassword(
        email: signUp.email,
        password: signUp.password,
      );

      await app.delete();

      final accountUid = account.user!.uid;
      final profile = AppUser.create(
        firstName: signUp.firstName,
        lastName: signUp.lastName,
        email: signUp.email,
        role: signUp.role,
        associationUid: signUp.associationUid,
        status: signUp.status,
        createdBy: _user == null ? accountUid : _user!.uid,
      );
      await _userService.createUser(uid: accountUid, user: profile);
    } on FirebaseAuthException catch (e) {
      await app.delete();
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _authStatus = AuthStatus.unauthenticated;

    notifyListeners();
  }

  void setDisplayName({required String displayName}) {
    _displayName = displayName;
    notifyListeners();
  }

  Future<void> goToSignIn() async {
    await signOut();
  }
}
