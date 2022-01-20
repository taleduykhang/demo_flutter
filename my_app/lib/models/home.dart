// ignore_for_file: prefer_collection_literals, unnecessary_this, unnecessary_new

class Home {
  bool? status;
  String? message;
  DataReturn? dataReturn;

  Home({this.status, this.message, this.dataReturn});

  Home.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    dataReturn = json['data_return'] != null
        ? DataReturn.fromJson(json['data_return'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (dataReturn != null) {
      data['data_return'] = dataReturn!.toJson();
    }
    return data;
  }
}

class DataReturn {
  List<Promo>? promo;
  List<FeaturedService>? featuredService;
  List<Branch>? branch;
  List<TopService>? topService;
  List<Item>? item;
  List<Staff>? staff;

  DataReturn(
      {this.promo,
      this.featuredService,
      this.branch,
      this.topService,
      this.item,
      this.staff});

  DataReturn.fromJson(Map<String, dynamic> json) {
    if (json['promo'] != null) {
      promo = <Promo>[];
      json['promo'].forEach((v) {
        promo!.add(Promo.fromJson(v));
      });
    }
    if (json['featured_service'] != null) {
      featuredService = <FeaturedService>[];
      json['featured_service'].forEach((v) {
        featuredService!.add(FeaturedService.fromJson(v));
      });
    }
    if (json['branch'] != null) {
      branch = <Branch>[];
      json['branch'].forEach((v) {
        branch!.add(Branch.fromJson(v));
      });
    }
    if (json['top_service'] != null) {
      topService = <TopService>[];
      json['top_service'].forEach((v) {
        topService!.add(TopService.fromJson(v));
      });
    }
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add(Item.fromJson(v));
      });
    }
    if (json['staff'] != null) {
      staff = <Staff>[];
      json['staff'].forEach((v) {
        staff!.add(Staff.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (promo != null) {
      data['promo'] = promo!.map((v) => v.toJson()).toList();
    }
    if (featuredService != null) {
      data['featured_service'] =
          featuredService!.map((v) => v.toJson()).toList();
    }
    if (branch != null) {
      data['branch'] = branch!.map((v) => v.toJson()).toList();
    }
    if (topService != null) {
      data['top_service'] = topService!.map((v) => v.toJson()).toList();
    }
    if (item != null) {
      data['item'] = item!.map((v) => v.toJson()).toList();
    }
    if (staff != null) {
      data['staff'] = staff!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promo {
  String? promoId;
  String? promoTitle;
  String? promoLink;
  String? promoImage;

  Promo({this.promoId, this.promoTitle, this.promoLink, this.promoImage});

  Promo.fromJson(Map<String, dynamic> json) {
    promoId = json['promo_id'];
    promoTitle = json['promo_title'];
    promoLink = json['promo_link'];
    promoImage = json['promo_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promo_id'] = this.promoId;
    data['promo_title'] = this.promoTitle;
    data['promo_link'] = this.promoLink;
    data['promo_image'] = this.promoImage;
    return data;
  }
}

class FeaturedService {
  String? id;
  String? type;
  String? itemName;
  String? image;
  String? price;
  String? specialPrice;
  String? duration;
  String? categoryName;
  int? favoriteType;

  FeaturedService(
      {this.id,
      this.type,
      this.itemName,
      this.image,
      this.price,
      this.specialPrice,
      this.duration,
      this.categoryName,
      this.favoriteType});

  FeaturedService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    itemName = json['item_name'];
    image = json['image'];
    price = json['price'];
    specialPrice = json['special_price'];
    duration = json['duration'];
    categoryName = json['category_name'];
    favoriteType = json['favorite_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['type'] = type;
    data['item_name'] = itemName;
    data['image'] = image;
    data['price'] = price;
    data['special_price'] = specialPrice;
    data['duration'] = duration;
    data['category_name'] = categoryName;
    data['favorite_type'] = favoriteType;
    return data;
  }
}

class Branch {
  String? branchId;
  String? branchName;
  String? branchImage;

  Branch({this.branchId, this.branchName, this.branchImage});

  Branch.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    branchImage = json['branch_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['branch_id'] = branchId;
    data['branch_name'] = branchName;
    data['branch_image'] = branchImage;
    return data;
  }
}

class TopService {
  String? id;
  String? type;
  String? itemName;
  String? image;
  String? price;
  dynamic specialPrice;
  String? duration;
  String? categoryName;
  String? totalUsed;
  int? favoriteType;

  TopService(
      {this.id,
      this.type,
      this.itemName,
      this.image,
      this.price,
      this.specialPrice,
      this.duration,
      this.categoryName,
      this.totalUsed,
      this.favoriteType});

  TopService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    itemName = json['item_name'];
    image = json['image'];
    price = json['price'];
    specialPrice = json['special_price'];
    duration = json['duration'];
    categoryName = json['category_name'];
    totalUsed = json['total_used'];
    favoriteType = json['favorite_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['type'] = type;
    data['item_name'] = itemName;
    data['image'] = image;
    data['price'] = price;
    data['special_price'] = specialPrice;
    data['duration'] = duration;
    data['category_name'] = categoryName;
    data['total_used'] = totalUsed;
    data['favorite_type'] = favoriteType;
    return data;
  }
}

class Item {
  String? id;
  String? name;
  String? image;
  String? price;
  String? specialPrice;
  String? duration;
  String? type;
  int? favoriteType;

  Item(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.specialPrice,
      this.duration,
      this.type,
      this.favoriteType});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    specialPrice = json['special_price'];
    duration = json['duration'];
    type = json['type'];
    favoriteType = json['favorite_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['special_price'] = specialPrice;
    data['duration'] = duration;
    data['type'] = type;
    data['favorite_type'] = favoriteType;
    return data;
  }
}

class Staff {
  String? id;
  String? fullname;
  String? telephone;
  String? email;
  String? image;
  String? staffCode;
  String? year;

  Staff(
      {this.id,
      this.fullname,
      this.telephone,
      this.email,
      this.image,
      this.staffCode,
      this.year});

  Staff.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    telephone = json['telephone'];
    email = json['email'];
    image = json['image'];
    staffCode = json['staff_code'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['fullname'] = fullname;
    data['telephone'] = telephone;
    data['email'] = email;
    data['image'] = image;
    data['staff_code'] = staffCode;
    data['year'] = year;
    return data;
  }
}
