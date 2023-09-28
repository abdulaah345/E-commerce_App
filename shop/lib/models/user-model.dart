class usermodel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  usermodel(this.name, this.email, this.phone, this.image, this.token);
  // factory usermodel.fromjson(jsondata) {
  //   return usermodel(
  //     name: jsondata['name'],
  //     email: jsondata['email'],
  //     phone: jsondata['phone'],
  //     image: jsondata['image'],
  //     token: jsondata['token'],
  //   );

  usermodel.fromjson({required Map<String, dynamic> data}) {
    name = data['name'];
    email = data['email'];
    phone = data['phone'];
    image = data['image'];
    token = data['token'];
  }

  Map<String, dynamic> ToMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'token': token,
    };
  }
}
