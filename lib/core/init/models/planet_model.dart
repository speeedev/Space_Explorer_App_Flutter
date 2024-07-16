class PlanetModel {
  int id;
  String name;
  String imageUrl;
  int orderOfProximityToSun;
  String shortDescription;
  String? longDescription;
  String primaryColor;
  String? videoUrl;

  PlanetModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.orderOfProximityToSun,
    required this.shortDescription,
    required this.primaryColor,
    this.longDescription,
    this.videoUrl,
  });

  PlanetModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imageUrl'],
        orderOfProximityToSun = json['orderOfProximityToSun'],
        shortDescription = json['shortDescription'],
        longDescription = json['longDescription'],
        primaryColor = json['primaryColor'],
        videoUrl = json['videoUrl'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'orderOfProximityToSun': orderOfProximityToSun,
        'shortDescription': shortDescription,
        'longDescription': longDescription,
        'primaryColor': primaryColor,
        'videoUrl': videoUrl,
      };
}
