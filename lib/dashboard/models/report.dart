class Report {
  late String user_code;
  late String user_name;
  late num rental_order_quantity;
  late num received_order_quantity;
  late num rental_amount;
  late num received_amount;

  Report({
    required this.user_code,
    required this.user_name,
    required this.rental_order_quantity,
    required this.received_order_quantity,
    required this.rental_amount,
    required this.received_amount,
  });

  Report.fromJson(Map<String, dynamic> json) {
    user_code = json['user_code'];
    user_name = json['user_name'];
    rental_order_quantity = json['rental_order_quantity'];
    received_order_quantity = json['received_order_quantity'];
    rental_amount = json['rental_amount'];
    received_amount = json['received_amount'];
  }

  Map<String, dynamic> toJson() => {
        'user_code': user_code,
        'user_name': user_name,
        'rental_order_quantity': rental_order_quantity,
        'received_order_quantity': received_order_quantity,
        'rental_amount': rental_amount,
        'received_amount': received_amount,
      };
}

class ReportResult {
  late List<Report> data;
  late num totalRentalOrderQuantity;
  late num totalReceivedOrderQuantity;
  late num totalRentalAmount;
  late num totalReceivedAmount;

  ReportResult({
    required this.data,
    required this.totalRentalOrderQuantity,
    required this.totalReceivedOrderQuantity,
    required this.totalRentalAmount,
    required this.totalReceivedAmount,
  });
}
