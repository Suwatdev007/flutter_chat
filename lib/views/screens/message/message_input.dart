import 'package:flutter/material.dart';
import 'package:untitled/constant.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({Key? key, required this.onSendMessage}) : super(key: key);
  final Function onSendMessage;

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: paddingVertical, horizontal: 10),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 0))
      ]),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                },
                icon: const Icon(
                  Icons.camera_alt,
                  color: primaryColor,
                )),
          ),
          SizedBox(
            width: 40,
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                },
                icon: const Icon(
                  Icons.photo,
                  color: primaryColor,
                )),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: padding),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: padding,),
                          fillColor: hintColor,
                          border: InputBorder.none,
                          hintText: 'message...'),
                    ),
                  ),
                  messageController.text.isNotEmpty
                      ? Container(
                          width: 30,
                          decoration: const BoxDecoration(
                              color: primaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {
                                widget.onSendMessage(messageController.text);
                                messageController.clear();
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 20,
                              )),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
