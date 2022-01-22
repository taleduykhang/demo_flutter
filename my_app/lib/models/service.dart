class Service {
  bool? status;
  List<Item>? items;
  int? perpage;
  int? currentPage;
  int? total;

  Service(
      {this.status, this.items, this.perpage, this.currentPage, this.total});

  Service.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    perpage = json['perpage'];
    currentPage = json['current_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['perpage'] = perpage;
    data['current_page'] = currentPage;
    data['total'] = total;
    return data;
  }
}

class Items {
  int? id;
  String? name;
  List<Items>? items;

  Items({this.id, this.name, this.items});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String? id;
  String? name;
  String? duration;
  String? price;
  String? description;
  String? specialPrice;
  String? image;
  String? type;
  int? favoriteType;

  Item(
      {this.id,
      this.name,
      this.duration,
      this.price,
      this.description,
      this.specialPrice,
      this.image,
      this.type,
      this.favoriteType});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    price = json['price'];
    description = json['description'];
    specialPrice = json['special_price'];
    image = json['image'];
    type = json['type'];
    favoriteType = json['favorite_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['duration'] = duration;
    data['price'] = price;
    data['description'] = description;
    data['special_price'] = specialPrice;
    data['image'] = image;
    data['type'] = type;
    data['favorite_type'] = favoriteType;
    return data;
  }
}
