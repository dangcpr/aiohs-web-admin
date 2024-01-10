class TypeArea {
  String type;
  String type_display;

  TypeArea({required this.type, required this.type_display});
}

List<TypeArea> typeAreas = [
  TypeArea(type: 'AREA_BOOKING_TYPE_RENT', type_display: 'Cho thuê'),
  TypeArea(type: 'AREA_BOOKING_TYPE_NEED_TO_RENT', type_display: 'Cần thuê'),
];