class Holiday {
  late String id;
  late String name;
  late String date;
  late String created_at;

  Holiday({
    required this.id,
    required this.name,
    required this.date,
    required this.created_at,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      created_at: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'date': date,
    'create_dat': created_at,
  };
}