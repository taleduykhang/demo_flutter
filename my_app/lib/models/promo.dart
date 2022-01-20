// ignore_for_file: unnecessary_this, prefer_collection_literals

class Promo {
  bool? status;
  int? size;
  int? page;
  List<Items>? items;

  Promo({status, size, page, items});

  Promo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    size = json['size'];
    page = json['page'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['size'] = size;
    data['page'] = page;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
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
  int? rate;
  int? quantity;
  String? couponCode;
  int? remainTimes;
  String? link;
  String? host;
  String? description;
  String? discountValue;
  List<Items>? items;

  Items(
      {id,
      name,
      dateStart,
      dateEnd,
      discountUnit,
      discountType,
      branchId,
      title,
      content,
      image,
      rate,
      quantity,
      couponCode,
      remainTimes,
      link,
      host,
      description,
      discountValue,
      items});

  Items.fromJson(Map<String, dynamic> json) {
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
    rate = json['rate'];
    quantity = json['quantity'];
    couponCode = json['coupon_code'];
    remainTimes = json['remain_times'];
    link = json['link'];
    host = json['host'];
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
    data['rate'] = rate;
    data['quantity'] = quantity;
    data['coupon_code'] = couponCode;
    data['remain_times'] = remainTimes;
    data['link'] = link;
    data['host'] = host;
    data['description'] = description;
    data['discount_value'] = discountValue;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
