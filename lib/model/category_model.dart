List<CategoryModel> getCategoryModelList(List<dynamic> list) {
  List<CategoryModel> result = [];
  list.forEach((item) {
    result.add(CategoryModel.fromJson(item));
  });
  return result;
}

class CategoryModel extends Object {
  String? categoryName;

  List<CategoryItem>? items;

  CategoryModel({
    this.categoryName,
    this.items,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> srcJson) {
    var list = <CategoryItem>[];
    if (srcJson['items'] != null) {
      for (var item in srcJson['items']) {
        list.add(CategoryItem.fromJson(item));
      }
    }
    return CategoryModel(
      categoryName: srcJson[''],
      items: list,
    );
  }

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "items": items,
      };
}

class CategoryItem extends Object {
  String? name;

  String? image;

  int? sort;

  CategoryItem({this.name, this.image, this.sort});

  factory CategoryItem.fromJson(Map<String, dynamic> srcJson) => CategoryItem(
      name: srcJson['name'], image: srcJson['image'], sort: srcJson['sort']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "iamge": image,
        "sort": sort,
      };
}
