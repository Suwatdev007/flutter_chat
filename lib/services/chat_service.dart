import 'package:untitled/models/message_model.dart';
import 'package:untitled/models/user_model.dart';

class ChatService {

  List<Message> getChats(){
    return chats.map((e) => Message.fromJson(e)).toList();
  }
  List<Message> getMessage(int? userId){
    return messages[userId]!.map((e) => Message.fromJson(e)).toList();
  }
}


//CHATS ON HOME SCREEN
const chats = [
  {
    "user": {
      "id": 7,
      "name": "Steven",
      "imgUrl": "assets/images/steven.jpg",
      "online": true,
    },
    "time": "2021-12-12 12:00:00",
    "text": "I eat so much food today.",
    "read": true
  },
  {
    "user": {
      "id": 6,
      "name": "Sophia",
      "imgUrl": "assets/images/sophia.jpg",
      "online": false,
    },
    "time": "2021-12-12 09:00:00",
    "text": "Hey",
    "read": false
  },
  {
    "user": {
      "id": 1,
      "name": "Greg",
      "imgUrl": "assets/images/greg.jpg",
      "online": true,
    },
    "time": "2021-12-12 09:00:00",
    "text": "Hey",
    "read": true
  },
  {
    "user": {
      "id": 2,
      "name": "James",
      "imgUrl": "assets/images/james.jpg",
      "online": true,
    },
    "time": "2021-12-11 22:00:00",
    "text": "Hey",
    "read": true
  },
  {
    "user": {
      "id": 3,
      "name": "John",
      "imgUrl": "assets/images/john.jpg",
      "online": true,
    },
    "time": "2021-12-11 15:00:00",
    "text": "Hey",
    "read": true
  },
  {
    "user": {
      "id": 4,
      "name": "Olivia",
      "imgUrl": "assets/images/olivia.jpg",
      "online": true,
    },
    "time": "2021-12-11 10:00:00",
    "text": "Hey",
    "read": true
  },
  {
    "user": {
      "id": 5,
      "name": "Sam",
      "imgUrl": "assets/images/sam.jpg",
      "online": false,
    },
    "time": "2021-12-10 12:00:00",
    "text": "Hey",
    "read": true
  },
];

//MESSAGE
const messages = {
  7:[
    {
      "user": {
        "id": 7,
        "name": "Steven",
        "imgUrl": "assets/images/steven.jpg"
      },
      "time": "2021-12-12 12:00:00",
      "text": "Hey, how's it going? What did you do today?",
      "read": true
    },
    {
      "user": {
        "id": 0,
        "name": "Ya",
        "imgUrl": "assets/images/ya.jpg"
      },
      "time": "2021-12-12 13:00:00",
      "text": "Just walked my doge. She was super duper cute. The best pupper!!",
      "read": true
    },
    {
      "user": {
        "id": 7,
        "name": "Steven",
        "imgUrl": "assets/images/steven.jpg"
      },
      "time": "2021-12-12 13:05:00",
      "text": "How's the doggo?",
      "read": true
    },
    {
      "user": {
        "id": 7,
        "name": "Steven",
        "imgUrl": "assets/images/steven.jpg"
      },
      "time": "2021-12-12 13:05:00",
      "text": "All the food",
      "read": true
    },
    {
      "user": {
        "id": 0,
        "name": "Ya",
        "imgUrl": "assets/images/ya.jpg"
      },
      "time": "2021-12-12 14:00:00",
      "text": "Nice! What kind of food did you eat?",
      "read": true
    },
    {
      "user": {
        "id": 7,
        "name": "Steven",
        "imgUrl": "assets/images/steven.jpg"
      },
      "time": "2021-12-12 15:00:00",
      "text": "I eat so much food today.",
      "read": true
    }
  ],
  6:[
    {
      "user": {
        "id": 6,
        "name": "Sophia",
        "imgUrl": "assets/images/sophia.jpg"
      },
      "time": "2021-12-12 09:00:00",
      "text": "Hey",
      "read": true
    },
  ],
  1:[
    {
      "user": {
        "id": 1,
        "name": "Greg",
        "imgUrl": "assets/images/greg.jpg"
      },
      "time": "2021-12-12 09:00:00",
      "text": "Hey",
      "read": true
    },
  ],
  2:[
    {
      "user": {
        "id": 2,
        "name": "James",
        "imgUrl": "assets/images/james.jpg"
      },
      "time": "2021-12-11 22:00:00",
      "text": "Hey",
      "read": true
    },
  ],
  3:[
    {
      "user": {
        "id": 3,
        "name": "John",
        "imgUrl": "assets/images/john.jpg"
      },
      "time": "2021-12-11 15:00:00",
      "text": "Hey",
      "read": true
    },
  ],
  4:[
    {
      "user": {
        "id": 4,
        "name": "Olivia",
        "imgUrl": "assets/images/olivia.jpg"
      },
      "time": "2021-12-11 10:00:00",
      "text": "Hey",
      "read": true
    },
  ],
  5:[
    {
      "user": {
        "id": 5,
        "name": "Sam",
        "imgUrl": "assets/images/sam.jpg"
      },
      "time": "2021-12-10 12:00:00",
      "text": "Hey",
      "read": true
    },
  ]
};

