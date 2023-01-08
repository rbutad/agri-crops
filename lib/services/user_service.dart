import 'package:agricrops/constants/firestore_collection_constant.dart';
import 'package:agricrops/enums/role_enum.dart';
import 'package:agricrops/models/user/app_user.dart';
import 'package:agricrops/utilities/global_utiility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  UserService();

  static UserService get instance => UserService();

  /// Get list of users (all users).
  /// This is only for sysadmin [Role: 0] only.
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsers() {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.appUsers)
        .where('role', isNotEqualTo: Role.sysadmin.index)
        .orderBy('role')
        .orderBy('lastName')
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUser(
    String accountUid,
  ) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.appUsers)
        .doc(accountUid)
        .snapshots();
  }

  /// Get list of users by specific association only.
  /// This is only for admin [Role: 1] only.
  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersByAssociation(
      String associationUid) {
    return firebaseFirestore
        .collection(FirestoreCollectionConstant.appUsers)
        .where('role', isNotEqualTo: Role.sysadmin.index)
        .orderBy('role')
        .where('associationUid', isEqualTo: associationUid)
        .orderBy('lastName')
        .snapshots();
  }

  Future<void> createUser({required String uid, required AppUser user}) async {
    await firebaseFirestore
        .collection(FirestoreCollectionConstant.appUsers)
        .doc(uid)
        .set(user.toJson());
  }

  Future<void> updateUser(AppUser user) async {
    firebaseFirestore
        .collection(FirestoreCollectionConstant.appUsers)
        .doc(user.uid)
        .update(user.toJson())
        .catchError((error) => Future.error(error));
  }
}
