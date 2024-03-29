class AreaBooking {
  late String code;
  late String user_code;
  late String type;
  late String type_display;
  late String status;
  late String status_display;
  late String title;
  late num number_rental_days;
  late num area;
  late num price;
  late String description;
  late List<String> images;
  late String address;
  late double longitude;
  late double latitude;
  late String created_at;
  late String updated_at;

  AreaBooking(
      {required this.code,
      required this.user_code,
      required this.type,
      required this.type_display,
      required this.status,
      required this.status_display,
      required this.title,
      required this.number_rental_days,
      required this.area,
      required this.price,
      required this.description,
      required this.images,
      required this.address,
      required this.longitude,
      required this.latitude,
      required this.created_at,
      required this.updated_at});

  AreaBooking.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    user_code = json['user_code'];
    type = json['type'];
    type_display = json['type_display'];
    status = json['status'];
    status_display = json['status_display'];
    title = json['title'];
    number_rental_days = json['number_rental_days'];
    area = json['area'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'user_code': user_code,
        'type': type,
        'type_display': type_display,
        'status': status,
        'status_display': status_display,
        'title': title,
        'number_rental_days': number_rental_days,
        'area': area,
        'price': price,
        'description': description,
        'images': images,
        'address': address,
        'longitude': longitude,
        'latitude': latitude,
        'created_at': created_at,
        'updated_at': updated_at,
      };
}

class AreaBookingResult {
  late String next;
  late List<AreaBooking> areaBookings;

  AreaBookingResult({required this.next, required this.areaBookings});
}
