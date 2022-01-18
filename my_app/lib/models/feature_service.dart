class FeaturedServices {
  bool? status;
  List<Items>? items;

  FeaturedServices({this.status, this.items});

  FeaturedServices.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? duration;
  String? price;
  String? specialPrice;
  String? image;
  String? name;
  String? type;
  int? favoriteType;

  Items(
      {this.id,
      this.duration,
      this.price,
      this.specialPrice,
      this.image,
      this.name,
      this.type,
      this.favoriteType});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    duration = json['duration'];
    price = json['price'];
    specialPrice = json['special_price'];
    image = json['image'];
    name = json['name'];
    type = json['type'];
    favoriteType = json['favorite_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['duration'] = duration;
    data['price'] = price;
    data['special_price'] = specialPrice;
    data['image'] = image;
    data['name'] = name;
    data['type'] = type;
    data['favorite_type'] = favoriteType;
    return data;
  }
}
