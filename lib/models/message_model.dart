import 'package:untitled/models/user_model.dart';

class Message{
  User? user;
  String? time;
  String? text;
  bool? read;

  Message({this.user, this.time, this.text, this.read});

  Message.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    time = json['time'];
    text = json['text'];
    read = json['read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['time'] = time;
    data['text'] = text;
    data['read'] = read;
    return data;
  }
}
