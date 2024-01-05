class StatusMaidRes {
  String code;
  String name;

  StatusMaidRes({required this.code, required this.name});
}

List<StatusMaidRes> statusMaidRes = [
  StatusMaidRes(code: 'MAID_REGISTRATION_STATUS_CREATED', name: 'Đang chờ duyệt'),
  StatusMaidRes(code: 'MAID_REGISTRATION_STATUS_APPROVED', name: 'Đã duyệt'),
  StatusMaidRes(code: 'MAID_REGISTRATION_STATUS_NEED_TO_UPDATE', name: 'Đã từ chối'),
];