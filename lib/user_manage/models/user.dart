class UserModel {
  late String code;
  late String full_name;
  late String email;
  late String phone_number;
  late String role;
  late String role_display;
  late String default_address;
  late String status;
  late String status_display;
  late String avatar_url;
  late String created_at;
  late String updated_at;

  UserModel({
    required this.code,
    required this.full_name,
    required this.email,
    required this.phone_number,
    required this.role,
    required this.role_display,
    required this.default_address,
    required this.status,
    required this.status_display,
    required this.avatar_url,
    required this.created_at,
    required this.updated_at,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    full_name = json['full_name'];
    email = json['email'];
    phone_number = json['phone_number'];
    role = json['role'];
    role_display = json['role_display'];
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
        'role_display': role_display,
        'default_address': default_address,
        'status': status,
        'status_display': status_display,
        'avatar_url': avatar_url,
        'created_at': created_at,
        'updated_at': updated_at,
      };
}

class UserResult {
  late String next;
  late List<UserModel> data;

  UserResult({
    required this.next,
    required this.data,
  });
}
