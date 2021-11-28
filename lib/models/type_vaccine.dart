class TypeVaccine {
  late int id;
  late String name;
  late String description;
  late String effects;
  late String pictureUrl;

  TypeVaccine({
    required this.id,
    required this.name,
    required this.description,
    required this.effects,
    required this.pictureUrl,
  });

  TypeVaccine.fromJson(Map<String, dynamic> typeVaccine) {
    id = typeVaccine['id'];
    name = typeVaccine['name'];
    description = typeVaccine['description'];
    effects = typeVaccine['effects'];
    pictureUrl = typeVaccine['picture_url'];
  }
}
