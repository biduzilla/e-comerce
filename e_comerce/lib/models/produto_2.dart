class Produto2 {
  bool? hasDiscount;
  String? name;
  List<String>? gallery;
  String? description;
  String? price;
  String? discountValue;
  Details? details;
  String? id;

  Produto2(
      {this.hasDiscount,
      this.name,
      this.gallery,
      this.description,
      this.price,
      this.discountValue,
      this.details,
      this.id});

  Produto2.fromJson(Map<String, dynamic> json) {
    hasDiscount = json['hasDiscount'];
    name = json['name'];
    gallery = json['gallery'].cast<String>();
    description = json['description'];
    price = json['price'];
    discountValue = json['discountValue'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasDiscount'] = this.hasDiscount;
    data['name'] = this.name;
    data['gallery'] = this.gallery;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountValue'] = this.discountValue;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Details {
  String? adjective;
  String? material;

  Details({this.adjective, this.material});

  Details.fromJson(Map<String, dynamic> json) {
    adjective = json['adjective'];
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adjective'] = this.adjective;
    data['material'] = this.material;
    return data;
  }
}
