class Product {
  late String code;
  late String name;
  late String title;
  late String type;
  late String icon_url;
  late String status;

  Product({
    required this.code,
    required this.name,
    required this.title,
    required this.type,
    required this.icon_url,
    required this.status,
  });

  Product.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    title = json['title'];
    type = json['type'];
    icon_url = json['icon_url'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'name': name,
    'title': title,
    'type': type,
    'icon_url': icon_url,
    'status': status,
  };
}
