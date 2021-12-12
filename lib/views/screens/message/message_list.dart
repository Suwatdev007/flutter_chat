import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/controllers/chat_controller.dart';
import 'package:untitled/models/message_model.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final _chatController = Get.put(ChatController());

  bool isLastMessageLeft(int index, List<Message> listMessage) {
    if ((index > 0 &&
            listMessage[index - 1].user!.id == _chatController.myProfile!.id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index, List<Message> listMessage) {
    if ((index > 0 &&
            listMessage[index - 1].user!.id != _chatController.myProfile!.id) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
      builder: (controller) {
        var messageList = controller.messageList.reversed.toList();
        return ListView.builder(
            reverse: true,
            controller: widget.scrollController,
            itemCount: messageList.length,
            itemBuilder: (context, index) {
              bool isMe =
                  messageList[index].user!.id == controller.myProfile!.id;
              return MessageItem(
                message: messageList[index],
                isMe: isMe,
                isMessageLeft: isLastMessageLeft(index, messageList),
                isMessageRight: isLastMessageRight(index, messageList),
              );
            });
      },
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem(
      {Key? key,
      required this.message,
      required this.isMe,
      this.isMessageLeft = false,
      this.isMessageRight = false})
      : super(key: key);
  final Message message;
  final bool isMe;
  final bool isMessageLeft;
  final bool isMessageRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: padding),
      child: isMe
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                          child: Text(
                            message.text!,
                            style: textSize14.merge(textWhiteColor),
                          ),
                        ),
                        isMessageRight
                            ? Container(
                                margin: const EdgeInsets.only(
                                    top: 5, right: 10, bottom: 5),
                                child: Text(
                                  DateFormat(datetimeDMMMFormat).format(
                                      DateTime.parse(message.time!)),
                                  style: textSize12.merge(textHintColor),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Container(
              margin: const EdgeInsets.only(
                top: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      isMessageLeft
                          ? CircleAvatar(
                              maxRadius: 15,
                              backgroundColor: Colors.white,
                              foregroundImage:
                                  AssetImage(message.user!.imgUrl!),
                            )
                          : const SizedBox(
                              width: 30,
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: const BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: Text(message.text!),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                  isMessageLeft
                      ? Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 45, bottom: 5),
                          child: Text(
                            DateFormat(datetimeDMMMFormat)
                                .format(DateTime.parse(message.time!)),
                            style: textSize12.merge(textHintColor),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
    );
  }
}
