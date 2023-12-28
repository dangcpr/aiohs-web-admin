class AirCondCleanPrice {
  late String product_id;
  late double unit_price;
  late double discount;
  late double bring_tools;
  late double on_peak_date;
  late double on_peak_hour;
  late double on_holiday;
  late double on_weekend;
  late double wall_Bellow2HP;
  late double wall_Above2HP;
  late double wall_GasRefill;
  late double portal_Portable;
  late double portal_GasRefill;
  late double cassette_Bellow3HP;
  late double cassette_Above3HP;
  late double cassette_GasRefill;
  late double floor_Bellow5HP;
  late double floor_Above5HP;
  late double floor_GasRefill;
  late double built_in_BuiltIn;
  late double built_in_GasRefill;

  AirCondCleanPrice({
    this.product_id = "0",
    this.unit_price = 0,
    this.discount = 0,
    this.bring_tools = 0,
    this.on_peak_date = 0,
    this.on_peak_hour = 0,
    this.on_holiday = 0,
    this.on_weekend = 0,
    this.wall_Bellow2HP = 0,
    this.wall_Above2HP = 0,
    this.wall_GasRefill = 0,
    this.portal_Portable = 0,
    this.portal_GasRefill = 0,
    this.cassette_Bellow3HP = 0,
    this.cassette_Above3HP = 0,
    this.cassette_GasRefill = 0,
    this.floor_Bellow5HP = 0,
    this.floor_Above5HP = 0,
    this.floor_GasRefill = 0,
    this.built_in_BuiltIn = 0,
    this.built_in_GasRefill = 0,
  });

  AirCondCleanPrice.fromJson(Map<String, dynamic> json) {
    product_id = json['product_id'];
    unit_price = json['unit_price'];
    discount = json['discount'];
    bring_tools = json['bring_tools'];
    on_peak_date = json['on_peak_date'];
    on_peak_hour = json['on_peak_hour'];
    on_holiday = json['on_holiday'];
    on_weekend = json['on_weekend'];
    wall_Bellow2HP = json['air_conditioning_clean_price']['wall']['Bellow2HP'];
    wall_Above2HP = json['air_conditioning_clean_price']['wall']['Above2HP'];
    wall_GasRefill = json['air_conditioning_clean_price']['wall']['GasRefill'];
    portal_Portable = json['air_conditioning_clean_price']['portable']['Portable'];
    portal_GasRefill = json['air_conditioning_clean_price']['portable']['GasRefill'];
    cassette_Bellow3HP = json['air_conditioning_clean_price']['cassette']['Bellow3HP'];
    cassette_Above3HP = json['air_conditioning_clean_price']['cassette']['Above3HP'];
    cassette_GasRefill = json['air_conditioning_clean_price']['cassette']['GasRefill'];
    floor_Bellow5HP = json['air_conditioning_clean_price']['floor']['Bellow5HP'];
    floor_Above5HP = json['air_conditioning_clean_price']['floor']['Above5HP'];
    floor_GasRefill = json['air_conditioning_clean_price']['floor']['GasRefill'];
    built_in_BuiltIn = json['air_conditioning_clean_price']['built_in']['BuiltIn'];
    built_in_GasRefill = json['air_conditioning_clean_price']['built_in']['GasRefill'];
  }

  Map<String, dynamic> toJson() => {
    'product_id': product_id,
    'unit_price': unit_price,
    'discount': discount,
    'bring_tools': bring_tools,
    'on_peak_date': on_peak_date,
    'on_peak_hour': on_peak_hour,
    'on_holiday': on_holiday,
    'on_weekend': on_weekend,
    'wall_Bellow2HP': wall_Bellow2HP,
    'wall_Above2HP': wall_Above2HP,
    'wall_GasRefill': wall_GasRefill,
    'portal_Portable': portal_Portable,
    'portal_GasRefill': portal_GasRefill,
    'cassette_Bellow3HP': cassette_Bellow3HP,
    'cassette_Above3HP': cassette_Above3HP,
    'cassette_GasRefill': cassette_GasRefill,
    'floor_Bellow5HP': floor_Bellow5HP,
    'floor_Above5HP': floor_Above5HP,
    'floor_GasRefill': floor_GasRefill,
    'built_in_BuiltIn': built_in_BuiltIn,
    'built_in_GasRefill': built_in_GasRefill,
  };
}
