import 'package:get/get.dart';
import 'package:untitled/models/message_model.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/services/chat_service.dart';
import 'package:untitled/services/user_service.dart';

class ChatController extends GetxController {
  final _userService = UserService();
  final _chatService = ChatService();

  User? myProfile;
  final chatList = <Message>[].obs;
  final messageList = <Message>[].obs;
  final friendList = <User>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProfile();
    fetchMyFriend();
    fetchChat();
  }

  fetchChat() {
    var res = _chatService.getChats();
    chatList.assignAll(res);
  }

  fetchGetMessage(User user) {
    messageList.clear();
    var res = _chatService.getMessage(user.id);
    messageList.assignAll(res);
  }

  void fetchProfile() {
    var res = _userService.getMyProfile();
    myProfile = res;
    update();
  }

  sendMessage(String message) {
    messageList.add(Message(
        user: myProfile,
        text: message,
        time: DateTime.now().toString(),
        read: false));
    update();
  }

  void fetchMyFriend() {
    var res = _userService.getMyFriend();
    friendList.assignAll(res);
    friendList.shuffle();
    update();
  }
}
