class Transaction {
  late String id;
  late String sender;
  late String receiver;
  late num amount;
  late String description;
  late String status;
  late String status_display;
  late String payment_provider;
  late String related_order;
  late String ref_id;
  late String image;
  late String created_at;
  late String updated_at;
  Transaction({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.description,
    required this.status,
    required this.status_display,
    required this.payment_provider,
    required this.related_order,
    required this.ref_id,
    required this.image,
    required this.created_at,
    required this.updated_at,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    receiver = json['receiver'];
    amount = json['amount'];
    description = json['description'];
    status = json['status'];
    status_display = json['status_display'];
    payment_provider = json['payment_provider'];
    related_order = json['related_order'];
    ref_id = json['ref_id'];
    image = json['image'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'sender': sender,
        'receiver': receiver,
        'amount': amount,
        'description': description,
        'status': status,
        'status_display': status_display,
        'payment_provider': payment_provider,
        'related_order': related_order,
        'ref_id': ref_id,
        'image': image,
        'created_at': created_at,
        'updated_at': updated_at,
      };
}
