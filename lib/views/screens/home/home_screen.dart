import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/controllers/chat_controller.dart';

import 'chat_list.dart';
import 'friend_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Chats',
          style: textSize24.merge(const TextStyle(fontWeight: FontWeight.bold)),
        ),
        titleSpacing: 5,
        actions: [
          Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: primaryDarkColor, shape: BoxShape.circle),
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))),
          const SizedBox(width: 10,)
        ],
        leading: IconButton(
          onPressed: () {},
          icon: GetBuilder<ChatController>(
            builder: (controller) {
              return CircleAvatar(
                backgroundColor: Colors.white,
                foregroundImage: AssetImage(controller.myProfile!.imgUrl!),
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          const FriendList(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: const ChatList(),
            ),
          ),
        ],
      ),
    );
  }
}
