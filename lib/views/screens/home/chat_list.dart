import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/controllers/chat_controller.dart';
import 'package:untitled/models/message_model.dart';
import 'package:untitled/utility.dart';
import 'package:untitled/views/screens/message/message_screen.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
      builder: (controller) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.chatList.length,
            itemBuilder: (context, index) => ChatItem(
                  index: index,
                  onClick: (message) {
                    Get.to(
                        MessageScreen(
                          user: message.user!,
                        ),
                    );
                  },
                  message: controller.chatList[index],
                ));
      },
    );
  }
}

typedef OnClickChat = Function(Message);

class ChatItem extends StatelessWidget {
  const ChatItem(
      {Key? key,
      required this.index,
      required this.onClick,
      required this.message})
      : super(key: key);
  final int index;
  final Message message;
  final OnClickChat onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 15 : 0),
      child: MaterialButton(
        onPressed: () {
          onClick(message);
        },
        padding: const EdgeInsets.symmetric(
            vertical: paddingVertical, horizontal: padding),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  maxRadius: 30,
                  foregroundImage: AssetImage('${message.user!.imgUrl}'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: message.user!.online == true ? onlineColor : offlineColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3)),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.user!.name!,
                    style:
                        textSize16.merge(message.read! ? textNormal : textBold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          message.text!,
                          style: textSize14.merge(
                              message.read! ? textHintColor : textBackColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(Utility().timeFormatToDisplay(DateTime.parse(message.time!)),
                          style: textSize14.merge(
                              message.read! ? textHintColor : textBackColor)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
