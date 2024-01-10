class Role {
  late String code;
  late String name;

  Role({
    required this.code,
    required this.name,
  });
}

List<Role> roles = [
  Role(code: 'USER_ROLE_UNSPECIFIED', name: 'Tất cả'),
  Role(code: 'USER_ROLE_MAID', name: 'Giúp việc'),
  Role(code: 'USER_ROLE_NORMAL', name: 'Người dùng'),
];