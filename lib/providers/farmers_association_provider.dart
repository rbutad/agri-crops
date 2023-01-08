import 'package:agricrops/models/farmers_association/farmers_association.dart';
import 'package:agricrops/services/farmers_association_service.dart';
import 'package:flutter/material.dart';

class FarmersAssociationProvider extends ChangeNotifier {
  final FarmersAssociationService _farmersAssociationService;

  FarmersAssociationProvider(this._farmersAssociationService);

  Stream<List<FarmersAssociation>> getFarmersAssociations() {
    return _farmersAssociationService.getFarmersAssociations().map((snapshot) =>
        snapshot.docs
            .map((document) => FarmersAssociation.fromDocument(document))
            .toList());
  }

  Stream<FarmersAssociation> getFarmersAssociationDetail(String uid) {
    return _farmersAssociationService
        .getFarmersAssociationDetail(uid)
        .map((document) => FarmersAssociation.fromDocument(document));
  }

  Future<List<FarmersAssociation>> searchFarmerAssociation(String association) {
    return _farmersAssociationService.searchFarmerAssociation(association);
  }

  Future<void> saveFarmersAssociation(
    FarmersAssociation farmersAssociation,
  ) async {
    await _farmersAssociationService
        .saveFarmersAssociation(farmersAssociation)
        .catchError((error) {
      debugPrint(error);
      throw Exception(error);
    });
  }

  Future<void> removeAssociation(String associationUid) async {
    _farmersAssociationService
        .removeAssociation(associationUid)
        .catchError((error) {
      debugPrint(error);
      throw Exception(error);
    });
  }
}
