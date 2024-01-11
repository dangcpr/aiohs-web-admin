class JobPosting {
  late String code;
  late String status;
  late String status_display;
  late String user_code;
  late double longitude;
  late double latitude;
  late String working_address;
  late String title;
  late int number_employee;
  late String description;
  late String wage_type;
  late String wage_type_display;
  late double wage_min;
  late double wage_max;
  late List<String> images;
  late String candidate_gender;
  late int candidate_min_age;
  late int candidate_max_age;
  late String candidate_experience;
  late String created_at;
  late String updated_at;
  
  JobPosting({
    required this.code,
    required this.status,
    required this.status_display,
    required this.user_code,
    required this.longitude,
    required this.latitude,
    required this.working_address,
    required this.title,
    required this.number_employee,
    required this.description,
    required this.wage_type,
    required this.wage_type_display,
    required this.wage_min,
    required this.wage_max,
    required this.images,
    required this.candidate_gender,
    required this.candidate_min_age,
    required this.candidate_max_age,
    required this.candidate_experience,
    required this.created_at,
    required this.updated_at,
  });

  JobPosting.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    status_display = json['status_display'];
    user_code = json['user_code'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    working_address = json['working_address'];
    title = json['title'];
    number_employee = json['number_employee'];
    description = json['description'];
    wage_type = json['wage_type'];
    wage_type_display = json['wage_type_display'];
    wage_min = json['wage_min'] is int ? json['wage_min'].toDouble() : json['wage_min'];
    wage_max = json['wage_max'] is int ? json['wage_max'].toDouble() : json['wage_max'];
    images = json['images'].cast<String>();
    candidate_gender = json['candidate_gender'];
    candidate_min_age = json['candidate_min_age'];
    candidate_max_age = json['candidate_max_age'];
    candidate_experience = json['candidate_experience'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'status': status,
    'status_display': status_display,
    'user_code': user_code,
    'longitude': longitude,
    'latitude': latitude,
    'working_address': working_address,
    'title': title,
    'number_employee': number_employee,
    'description': description,
    'wage_type': wage_type,
    'wage_type_display': wage_type_display,
    'wage_min': wage_min,
    'wage_max': wage_max,
    'images': images,
    'candidate_gender': candidate_gender,
    'candidate_min_age': candidate_min_age,
    'candidate_max_age': candidate_max_age,
    'candidate_experience': candidate_experience,
    'created_at': created_at,
    'updated_at': updated_at,
  };
}

class JobPostingResult {
  late String next;
  late List<JobPosting> results;

  JobPostingResult({
    required this.next,
    required this.results,
  });
}