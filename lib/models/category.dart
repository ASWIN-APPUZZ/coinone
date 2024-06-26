class TemplateCategory {
  final String id;
  final String name;
  final String imgUrlPath;

  TemplateCategory({
    required this.id,
    required this.name,
    required this.imgUrlPath,
  });

  factory TemplateCategory.fromJson(Map<String, dynamic> json) {
    return TemplateCategory(
      id: json['Id'],
      name: json['Name'],
      imgUrlPath: json['ImgUrlPath'],
    );
  }
}