class MaidRegistration {
  late String user_code;
  late String full_name;
  late String identity_no;
  late String issued_on;
  late String permanent_address;
  late String date_of_birth;
  late String identity_front_image_url;
  late String identity_back_image_url;
  late String contact_address;
  late double avg_star;
  late int total_rating;
  late String registration_status;
  late String registration_status_display;
  late String reason;
  
  MaidRegistration({
    required this.user_code,
    required this.full_name,
    required this.identity_no,
    required this.issued_on,
    required this.permanent_address,
    required this.date_of_birth,
    required this.identity_front_image_url,
    required this.identity_back_image_url,
    required this.contact_address,
    required this.avg_star,
    required this.total_rating,
    required this.registration_status,
    required this.registration_status_display,
    required this.reason,
  });

  MaidRegistration.fromJson(Map<String, dynamic> json) {
    user_code = json['user_code'];
    full_name = json['full_name'];
    identity_no = json['identity_no'];
    issued_on = json['issued_on'];
    permanent_address = json['permanent_address'];
    date_of_birth = json['date_of_birth'];
    identity_front_image_url = json['identity_front_image_url'];
    identity_back_image_url = json['identity_back_image_url'];
    contact_address = json['contact_address'];
    avg_star = json['avg_star'];
    total_rating = json['total_rating'];
    registration_status = json['registration_status'];
    registration_status_display = json['registration_status_display'];
    reason = json['reason'];
  }
}

class MaidRegistrationResult {
  late String next;
  late List<MaidRegistration> data;

  MaidRegistrationResult({
    required this.next,
    required this.data,
  });
}