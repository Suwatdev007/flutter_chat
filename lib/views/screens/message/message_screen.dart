import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/controllers/chat_controller.dart';
import 'package:untitled/models/user_model.dart';

import 'message_input.dart';
import 'message_list.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _chatController = Get.put(ChatController());
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _chatController.fetchGetMessage(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: primaryDarkColor, shape: BoxShape.circle),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
            )),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                color: primaryDarkColor, shape: BoxShape.circle),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: primaryDarkColor, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.videocam))),
          const SizedBox(
            width: 10,
          ),
        ],
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  foregroundImage: AssetImage('${widget.user.imgUrl}'),
                ),
                widget.user.online == true
                    ? Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: onlineColor,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: primaryColor, width: 2)),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.user.name}',
                  style: textSize18.merge(textWhiteColor),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  widget.user.online == true ? 'online' : 'offline',
                  style: textSize12.merge(textWhiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: MessageList(
                  scrollController: _scrollController,
                ),
              ),
            ),
          ),
          MessageInput(
            onSendMessage: (message) async {
              _chatController.sendMessage(message);
              await Future.delayed(const Duration(milliseconds: 100));
              _scrollController.jumpTo(0);
            },
          ),
        ],
      ),
    );
  }
}
