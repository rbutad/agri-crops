import 'package:agricrops/models/farmers_association/farmers_association.dart';
import 'package:agricrops/models/user/app_user.dart';
import 'package:agricrops/services/farmers_association_service.dart';
import 'package:agricrops/services/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserService _userService;
  final FarmersAssociationService _associationService;

  UserProvider(this._userService, this._associationService);

  Stream<List<AppUser>> getUsers() {
    var users = _userService.getUsers().map((snapshot) => snapshot.docs
        .map((document) => AppUser.fromDocument(document))
        .toList());

    users = users.asyncMap((users) => Future.wait(
          users.map<Future<AppUser>>((user) async {
            var document = await _associationService
                .getFarmersAssociationDetailFuture(user.associationUid);

            final association = FarmersAssociation.fromDocument(document);
            return user.copyWith(associationName: association.name);
          }),
        ));

    return users;
  }

  Stream<AppUser> getUser(String accountUid) {
    return _userService
        .getUser(accountUid)
        .map((document) => AppUser.fromDocument(document));
  }

  /// Get list of users by specific association only.
  /// This is only for admin [Role: 1] only.
  Stream<List<AppUser>> getUsersByAssociation(String associationUid) {
    return _userService.getUsersByAssociation(associationUid).map((snapshot) =>
        snapshot.docs
            .map((document) => AppUser.fromDocument(document))
            .toList());
  }

  Future<void> updateUser(AppUser user) async {
    await _userService
        .updateUser(user)
        .catchError((error) => throw Exception(error));
  }
}
