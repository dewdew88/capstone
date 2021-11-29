import 'dart:convert';

class Vaccine {
  late int id;
  late String name;
  late String city;
  late String address;
  late String date;
  late String time;
  late String contact;
  late int quota;
  late String type;
  late String urlImage;

  Vaccine({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.date,
    required this.time,
    required this.contact,
    required this.quota,
    required this.type,
    required this.urlImage,
  });

  factory Vaccine.fromJson(Map<String, dynamic> vaccine) {
    return Vaccine(
      id: vaccine['id'],
      name: vaccine['name'],
      city: vaccine['city'],
      address: vaccine['address'],
      date: vaccine['date'],
      time: vaccine['time'],
      contact: vaccine['contact'],
      quota: vaccine['quota'],
      type: vaccine['type'],
      urlImage: vaccine['urlImage'],
    );
  }
}

List<Vaccine> parsedVaccine(String? json) {
  if (json == null) {
    return [];
  }
  final List parsed = jsonDecode(json);
  return parsed.map((json) => Vaccine.fromJson(json)).toList();
}
