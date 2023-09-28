class bannermodel {
  int? id;
  String? image;

  bannermodel.fromjson({required Map<String, dynamic> data}) {
    id = data['id'];
    image = data['image'];
  }
}
