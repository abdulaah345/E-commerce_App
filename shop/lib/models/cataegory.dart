class categorymodel {
  int? id;
  String? name;
  String? image;
  String? desc;

  categorymodel.fromjson({required Map<String, dynamic> data}) {
    id = data['id'];
    name = data['name'];
    image = data['image'];
    desc = data['description'];
  }
}
