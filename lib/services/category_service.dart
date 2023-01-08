import 'package:agricrops/constants/firestore_collection_constant.dart';
import 'package:agricrops/models/category/category.dart';
import 'package:agricrops/utilities/global_utiility.dart';

class CategoryService {
  CategoryService();

  Stream<List<Category>> getCategories() {
    final categories = firebaseFirestore
        .collection(FirestoreCollectionConstant.categories)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Category.fromJson(document.data()))
            .toList());

    return categories;
  }

  Future<List<Category>> searchCategory({required String categoryQuery}) async {
    final categories = await firebaseFirestore
        .collection(FirestoreCollectionConstant.categories)
        .where('name', isGreaterThanOrEqualTo: categoryQuery)
        .get()
        .then((snapshot) => snapshot.docs
            .map((document) => Category.fromDocument(document))
            .toList());

    return categories;
  }
}
