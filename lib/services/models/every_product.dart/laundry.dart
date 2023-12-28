class LaundryPrice {
  late String product_id;
  late double clothes;
  late double blanket;
  late double mosquito;
  late double net;
  late double drap;
  late double topper;
  late double pillow;
  late double comple;
  late double vietnamDress;
  late double weedingDress;
  late double bleaching;
  late double onPeakDate;
  late double onPeakHour;
  late double onHoliday;
  late double onWeekend;
  late double discount;
  late double unit_price;
  late double bring_tools;

  LaundryPrice({
    this.product_id = "0",
    this.clothes = 0,
    this.blanket = 0,
    this.mosquito = 0,
    this.net = 0,
    this.drap = 0,
    this.topper = 0,
    this.pillow = 0,
    this.comple = 0,
    this.vietnamDress = 0,
    this.weedingDress = 0,
    this.bleaching = 0,
    this.onPeakDate = 0,
    this.onPeakHour = 0,
    this.onHoliday = 0,
    this.onWeekend = 0,
    this.discount = 0,
    this.unit_price = 0,
    this.bring_tools = 0,
  });

  LaundryPrice.fromJson(Map<String, dynamic> json) {
    clothes = json['laundry_price']['normal_cleaning']['Clothes'];
    blanket = json['laundry_price']['normal_cleaning']['Blanket'];
    mosquito = json['laundry_price']['normal_cleaning']['Mosquito'];
    net = json['laundry_price']['normal_cleaning']['Net'];
    drap = json['laundry_price']['normal_cleaning']['Drap'];
    topper = json['laundry_price']['normal_cleaning']['Topper'];
    pillow = json['laundry_price']['normal_cleaning']['Pillow'];
    comple = json['laundry_price']['others']['Comple'];
    vietnamDress = json['laundry_price']['others']['VietnamDress'];
    weedingDress = json['laundry_price']['others']['WeddingDress'];
    bleaching = json['laundry_price']['others']['Bleaching'];
    onPeakDate = json['on_peak_date'];
    onPeakHour = json['on_peak_hour'];
    onHoliday = json['on_holiday'];
    onWeekend = json['on_weekend'];
    discount = json['discount'];
    product_id = json['product_id'];
    unit_price = json['unit_price'];
    bring_tools = json['bring_tools'];
  }

  Map<String, dynamic> toJson() => {
        'clothes': clothes,
        'blanket': blanket,
        'mosquito': mosquito,
        'net': net,
        'drap': drap,
        'topper': topper,
        'pillow': pillow,
        'comple': comple,
        'vietnamDress': vietnamDress,
        'weedingDress': weedingDress,
        'bleaching': bleaching,
        'onPeakDate': onPeakDate,
        'onPeakHour': onPeakHour,
        'onHoliday': onHoliday,
        'onWeekend': onWeekend,
        'discount': discount,
        'product_id': product_id,
        'unit_price': unit_price,
        'bring_tools': bring_tools,
      };
}
