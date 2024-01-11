class RatingMaid {
  late String code;
  late String maid_code;
  late String renter_code;
  late String renter_name;
  late String order_code;
  late String product_code;
  late String product_name;
  late String comment;
  late double star;

  RatingMaid({
    required this.code,
    required this.maid_code,
    required this.renter_code,
    required this.renter_name,
    required this.order_code,
    required this.product_code,
    required this.product_name,
    required this.comment,
    required this.star,
  });

  RatingMaid.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    maid_code = json['maid_code'];
    renter_code = json['renter_code'];
    renter_name = json['renter_name'];
    order_code = json['order_code'];
    product_code = json['product_code'];
    product_name = json['product_name'];
    comment = json['comment'];
    star =
        json['star'] is int ? (json['star'] as int).toDouble() : json['star'];
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'maid_code': maid_code,
        'renter_code': renter_code,
        'renter_name': renter_name,
        'order_code': order_code,
        'product_code': product_code,
        'product_name': product_name,
        'comment': comment,
        'star': star,
      };
}
