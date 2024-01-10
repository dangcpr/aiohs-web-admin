class StatusArea {
  String status;
  String status_display;

  StatusArea({required this.status, required this.status_display});
}

List<StatusArea> statusAreas = [
  StatusArea(status: 'AREA_BOOKING_STATUS_ACTIVE', status_display: 'Đang hoạt động'),
  StatusArea(status: 'AREA_BOOKING_STATUS_INACTIVE', status_display: 'Đã hủy đăng'),
];