class TemplateSubCategory {
  final String id;
  final String name;
  final String imgUrlPath;

  TemplateSubCategory({
    required this.id,
    required this.name,
    required this.imgUrlPath,
  });

  factory TemplateSubCategory.fromJson(Map<String, dynamic> json) {
    return TemplateSubCategory(
      id: json['Id'],
      name: json['Name'],
      imgUrlPath: json['ImgUrlPath'],
    );
  }
}