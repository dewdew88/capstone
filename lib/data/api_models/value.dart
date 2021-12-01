class Value {
  late int value;

  Value({required this.value});

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(value: json['value']);
  }
}