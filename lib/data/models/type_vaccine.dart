import 'dart:convert';

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

  factory TypeVaccine.fromJson(Map<String, dynamic> typeVaccine) {
    return TypeVaccine(
        id: typeVaccine['id'],
        name: typeVaccine['name'],
        description: typeVaccine['description'],
        effects: typeVaccine['effects'],
        pictureUrl: typeVaccine['picture_url'],
    );
  }
}

List<TypeVaccine> parsedTypeVaccine (String? json) {
  if (json ==  null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => TypeVaccine.fromJson(json)).toList();
}
