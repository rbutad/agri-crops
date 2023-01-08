import 'package:agricrops/models/unit_of_measurement/unit_of_measurement.dart';
import 'package:agricrops/services/uom_service.dart';
import 'package:flutter/material.dart';

class UomProvider extends ChangeNotifier {
  final UomService _uomService;

  UomProvider(this._uomService);

  Future<List<UnitOfMeasurement>> searchUom({required String uomQuery}) async {
    var uoms = await _uomService.searchUom(uom: uomQuery);
    uoms = uoms
        .where((uom) =>
            uom.code.toLowerCase().contains(uomQuery.toLowerCase()) ||
            uom.description.toLowerCase().contains(uomQuery.toLowerCase()))
        .toList();

    return uoms;
  }
}
