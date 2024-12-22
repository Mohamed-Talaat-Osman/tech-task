class OrdersDataModel {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  String? status;
  String? registered;

  OrdersDataModel(
      {this.id,
        this.isActive,
        this.price,
        this.company,
        this.picture,
        this.buyer,
        this.tags,
        this.status,
        this.registered});

  OrdersDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    price = json['price'];
    company = json['company'];
    picture = json['picture'];
    buyer = json['buyer'];
    tags = json['tags'].cast<String>();
    status = json['status'];
    registered = json['registered'];
  }
}
