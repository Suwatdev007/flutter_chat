class User{
  int? id;
  String? name;
  String? imgUrl;
  bool? online;

  User({this.id, this.name, this.imgUrl,this.online});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imgUrl = json['imgUrl'];
    online = json['online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imgUrl'] = imgUrl;
    return data;
  }
}