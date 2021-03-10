
class ContentMainModel{
  final String id;
  final String name;
  const ContentMainModel({required this.id, required this.name});
  factory ContentMainModel.fromJson({required Map<String, dynamic> json})
    => ContentMainModel(id: json['id'].toString(), name: json['name'].toString());
}