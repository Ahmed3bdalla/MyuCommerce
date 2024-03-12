class UserModel {
  late String name, email, userid, id;
  UserModel(
      {required this.name,
      required this.email,
      required this.id,
      required this.userid});
  factory UserModel.fromjson(Map<String, dynamic> map) {
    return UserModel(
        name: map["name"],
        email: map["email"],
        id: map["pic"],
        userid: map["userid"]);
  }
  tojson() {
    return {"name": name, "email": email, "userid": userid, "pic": id};
  }
}
