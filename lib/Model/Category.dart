import 'package:shiv_sakti/Database%20Helper/DatabaseHelper.dart';

class Category {
  int? id;
  String? name;

  Category({this.name, this.id});

  Map<String, dynamic> toJson() =>
      {DatabaseHelper.CATEGORY_NAME: name, DatabaseHelper.CATEGORY_ID: id};
  // categoryMap() {
  //   var mapping = Map<String, dynamic>();
  //   mapping['id'] = id ?? null;
  //   mapping['name'] = name!;
  //   return mapping;
  // }

  static Category fromJson(Map<String, Object?> json) => Category(
        id: json[DatabaseHelper.CATEGORY_ID] as int?,
        name: json[DatabaseHelper.CATEGORY_NAME] as String,
      );
}
