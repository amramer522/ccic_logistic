class CategoriesData {
  late final List<CategoryModel> list;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? []).map((e) => CategoryModel.fromJson(e)).toList();
  }
}

class CategoryModel {
  late final int id;
  late final String nameAr;
  late final String nameEn;
  late final String iconUrl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    nameAr = json['nameAr'] ?? "";
    nameEn = json['nameEn'] ?? "";
    iconUrl = json['iconUrl'] ?? "";
  }
}