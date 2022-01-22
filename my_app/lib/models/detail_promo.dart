// ignore_for_file: prefer_collection_literals

class DetailPromo {
  bool? status;
  PromoData? promoData;

  DetailPromo({this.status, this.promoData});

  DetailPromo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    promoData = json['promo_data'] != null
        ? PromoData.fromJson(json['promo_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (promoData != null) {
      data['promo_data'] = promoData!.toJson();
    }
    return data;
  }
}

class PromoData {
  String? id;
  String? name;
  String? dateStart;
  String? dateEnd;
  String? discountUnit;
  String? discountType;
  String? branchId;
  String? title;
  String? content;
  String? image;
  int? quantity;
  String? couponCode;
  int? remainTimes;
  String? description;
  String? discountValue;
  List<Items>? items;

  PromoData(
      {this.id,
      this.name,
      this.dateStart,
      this.dateEnd,
      this.discountUnit,
      this.discountType,
      this.branchId,
      this.title,
      this.content,
      this.image,
      this.quantity,
      this.couponCode,
      this.remainTimes,
      this.description,
      this.discountValue,
      this.items});

  PromoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    discountUnit = json['discount_unit'];
    discountType = json['discount_type'];
    branchId = json['branch_id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    quantity = json['quantity'];
    couponCode = json['coupon_code'];
    remainTimes = json['remain_times'];
    description = json['description'];
    discountValue = json['discount_value'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['date_start'] = dateStart;
    data['date_end'] = dateEnd;
    data['discount_unit'] = discountUnit;
    data['discount_type'] = discountType;
    data['branch_id'] = branchId;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['quantity'] = quantity;
    data['coupon_code'] = couponCode;
    data['remain_times'] = remainTimes;
    data['description'] = description;
    data['discount_value'] = discountValue;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? name;
  String? branchId;
  int? price;
  int? specialPrice;
  String? serviceGroupId;
  String? image;
  String? type;
  int? originPrice;
  int? retailPrice;
  String? description;

  Items(
      {this.id,
      this.name,
      this.branchId,
      this.price,
      this.specialPrice,
      this.serviceGroupId,
      this.image,
      this.type,
      this.originPrice,
      this.retailPrice,
      this.description});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    branchId = json['branch_id'];
    price = json['price'];
    specialPrice = json['special_price'];
    serviceGroupId = json['service_group_id'];
    image = json['image'];
    type = json['type'];
    originPrice = json['origin_price'];
    retailPrice = json['retail_price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['branch_id'] = branchId;
    data['price'] = price;
    data['special_price'] = specialPrice;
    data['service_group_id'] = serviceGroupId;
    data['image'] = image;
    data['type'] = type;
    data['origin_price'] = originPrice;
    data['retail_price'] = retailPrice;
    data['description'] = description;
    return data;
  }
}
