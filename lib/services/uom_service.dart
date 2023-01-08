import 'package:agricrops/constants/firestore_collection_constant.dart';
import 'package:agricrops/models/unit_of_measurement/unit_of_measurement.dart';
import 'package:agricrops/utilities/global_utiility.dart';

class UomService {
  UomService();

  static UomService get instance => UomService();

  Future<List<UnitOfMeasurement>> searchUom({required String uom}) async {
    var uoms = await firebaseFirestore
        .collection(FirestoreCollectionConstant.unitOfMeasures)
        .get()
        .then((snapshot) => snapshot.docs
            .map((document) => UnitOfMeasurement.fromDocument(document))
            .toList());

    return uoms;
  }
}
