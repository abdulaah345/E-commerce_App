class cartmodel {
  String? name;
  String? description;
  int? price;
  int? oldprice;
  String? image;
  int? discont;
  int? id;
  int qtn = 0;

  cartmodel.fromjson({required Map<String, dynamic> data}) {
    id = data['id'].toInt();
    price = data['price'].toInt();
    oldprice = data['old_price'].toInt();
    discont = data['discount'].toInt();
    description = data['description'].toString();
    name = data['name'].toString();
    image = data['image'].toString();
    qtn = data['quantity'];
  }
}
