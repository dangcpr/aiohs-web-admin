class LaundryPrice {
  late String product_id;
  late num clothes;
  late num blanket;
  late num mosquito;
  late num net;
  late num drap;
  late num topper;
  late num pillow;
  late num comple;
  late num vietnamDress;
  late num weedingDress;
  late num bleaching;
  late num clothes_k;
  late num blanket_k;
  late num mosquito_k;
  late num net_k;
  late num drap_k;
  late num topper_k;
  late num pillow_k;
  late num comple_k;
  late num vietnamDress_k;
  late num weedingDress_k;
  late num bleaching_k;
  late num onPeakDate;
  late num onPeakHour;
  late num onHoliday;
  late num onWeekend;
  late num discount;
  late num unit_price;
  late num bring_tools;

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
    clothes =
        json['laundry_price']['price_clothes']['normal_cleaning']['Clothes'];
    blanket =
        json['laundry_price']['price_clothes']['normal_cleaning']['Blanket'];
    mosquito =
        json['laundry_price']['price_clothes']['normal_cleaning']['Mosquito'];
    net = json['laundry_price']['price_clothes']['normal_cleaning']['Net'];
    drap = json['laundry_price']['price_clothes']['normal_cleaning']['Drap'];
    topper =
        json['laundry_price']['price_clothes']['normal_cleaning']['Topper'];
    pillow =
        json['laundry_price']['price_clothes']['normal_cleaning']['Pillow'];
    comple = json['laundry_price']['price_clothes']['others']['Comple'];
    vietnamDress =
        json['laundry_price']['price_clothes']['others']['VietnamDress'];
    weedingDress =
        json['laundry_price']['price_clothes']['others']['WeddingDress'];
    bleaching = json['laundry_price']['price_clothes']['others']['Bleaching'];

    clothes_k =
        json['laundry_price']['price_kg']['normal_cleaning']['Clothes'];
    blanket_k = json['laundry_price']['price_kg']['normal_cleaning']['Blanket'];
    mosquito_k =
        json['laundry_price']['price_kg']['normal_cleaning']['Mosquito'];
    net_k = json['laundry_price']['price_kg']['normal_cleaning']['Net'];
    drap_k = json['laundry_price']['price_kg']['normal_cleaning']['Drap'];
    topper_k = json['laundry_price']['price_kg']['normal_cleaning']['Topper'];
    pillow_k = json['laundry_price']['price_kg']['normal_cleaning']['Pillow'];
    comple_k = json['laundry_price']['price_kg']['others']['Comple'];
    vietnamDress_k =
        json['laundry_price']['price_kg']['others']['VietnamDress'];
    weedingDress_k = json['laundry_price']['price_kg']['others']['WeddingDress'];
    bleaching_k = json['laundry_price']['price_kg']['others']['Bleaching'];
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
        'clothes_k': clothes_k,
        'blanket_k': blanket_k,
        'mosquito_k': mosquito_k,
        'net_k': net_k,
        'drap_k': drap_k,
        'topper_k': topper_k,
        'pillow_k': pillow_k,
        'comple_k': comple_k,
        'vietnamDress_k': vietnamDress_k,
        'weedingDress_k': weedingDress_k,
        'bleaching_k': bleaching_k,
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
