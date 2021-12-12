import 'package:untitled/models/user_model.dart';

class UserService {
  User getMyProfile() {
    return User.fromJson(profile);
  }

  List<User> getMyFriend() {
    return friends.map((e) => User.fromJson(e)).toList();
  }
}

//MY PROFILE
const profile = {"id": 0, "name": "Ya", "imgUrl": "assets/images/ya.png"};

const friends = [
  {
    "id": 7,
    "name": "Steven",
    "imgUrl": "assets/images/steven.jpg",
    "online": true,
  },
  {
    "id": 6,
    "name": "Sophia",
    "imgUrl": "assets/images/sophia.jpg",
    "online": false,
  },
  {
    "id": 1,
    "name": "Greg",
    "imgUrl": "assets/images/greg.jpg",
    "online": true,
  },
  {
    "id": 2,
    "name": "James",
    "imgUrl": "assets/images/james.jpg",
    "online": true,
  },
  {
    "id": 3,
    "name": "John",
    "imgUrl": "assets/images/john.jpg",
    "online": true,
  },
  {
    "id": 4,
    "name": "Olivia",
    "imgUrl": "assets/images/olivia.jpg",
    "online": true,
  },
  {
    "id": 5,
    "name": "Sam",
    "imgUrl": "assets/images/sam.jpg",
    "online": false,
  },
];
