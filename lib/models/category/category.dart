import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    @JsonKey(ignore: true) @Default('') String uid,
    @Default('') String name,
    @Default('') String photoUrl,
  }) = _Category;

  factory Category.create({
    required String name,
    String photoUrl = '',
  }) {
    return Category(
      name: name,
      photoUrl: photoUrl,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  factory Category.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return _$CategoryFromJson(document.data()!).copyWith(uid: document.id);
  }
}
