class User {
  late String? code;
  late String? full_name;
  late String? email;
  late String? phone_number;
  late String? role;
  late String? default_address;
  late String? status;
  late String? status_display;
  late String? avatar_url;
  late String? created_at;
  late String? updated_at;

  User({
    this.code,
    this.full_name,
    this.email,
    this.phone_number,
    this.role,
    this.default_address,
    this.status,
    this.status_display,
    this.avatar_url,
    this.created_at,
    this.updated_at,
  });

  User.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    full_name = json['full_name'];
    email = json['email'];
    phone_number = json['phone_number'];
    role = json['role'];
    default_address = json['default_address'];
    status = json['status'];
    status_display = json['status_display'];
    avatar_url = json['avatar_url'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'full_name': full_name,
    'email': email,
    'phone_number': phone_number,
    'role': role,
    'default_address': default_address,
    'status': status,
    'status_display': status_display,
    'avatar_url': avatar_url,
    'created_at': created_at,
    'updated_at': updated_at,
  };
}
