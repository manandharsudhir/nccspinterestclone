class InterestModel {
  String? id;
  String? name;
  String? image;
  bool isSelected;

  InterestModel({this.id, this.image, this.name, this.isSelected = false});

  factory InterestModel.fromJson(Map<String, dynamic> data) => InterestModel(
        id: data["id"],
        name: data["name"],
        image: data["image_url"],
      );
}
