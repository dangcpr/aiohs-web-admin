class CleaningSubPrice {
  late String product_id;
  late double unit_price;
  late double discount;
  late double bring_tools;
  late double on_peak_date;
  late double on_peak_hour;
  late double on_holiday;
  late double on_weekend;

  CleaningSubPrice({
    this.product_id = "0",
    this.unit_price = 0,
    this.discount = 0,
    this.bring_tools = 0,
    this.on_peak_date = 0,
    this.on_peak_hour = 0,
    this.on_holiday = 0,
    this.on_weekend = 0,
  });

  CleaningSubPrice.fromJson(Map<String, dynamic> json) {
    product_id = json['product_id'];
    unit_price = json['unit_price'];
    discount = json['discount'];
    bring_tools = json['bring_tools'];
    on_peak_date = json['on_peak_date'];
    on_peak_hour = json['on_peak_hour'];
    on_holiday = json['on_holiday'];
    on_weekend = json['on_weekend'];
  }

  Map<String, dynamic> toJson() => {
    'product_id': product_id,
    'unit_price': unit_price,
    'discount': discount,
    'bring_tools': bring_tools,
    'on_peak_date': on_peak_date,
    'on_peak_hour': on_peak_hour,
    'on_holiday': on_holiday,
    'on_weekend': on_weekend
  };
} 