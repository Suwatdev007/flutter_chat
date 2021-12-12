import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/controllers/chat_controller.dart';
import 'package:untitled/models/user_model.dart';
import 'package:untitled/views/screens/message/message_screen.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: double.maxFinite,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: padding,
            ),
            const CircleAvatar(
              maxRadius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add_rounded,
                color: primaryColor,
                size: 35,
              ),
            ),
            GetX<ChatController>(
              builder: (controller) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.friendList.length,
                    itemBuilder: (context, index) => FriendItem(
                          index: index,
                          length: controller.friendList.length,
                          user: controller.friendList[index],
                          onclick: (User user) {
                            Get.to(
                              MessageScreen(
                                user: user,
                              ),
                            );
                          },
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}

typedef OnClickUser = Function(User);

class FriendItem extends StatelessWidget {
  const FriendItem(
      {Key? key,
      required this.index,
      required this.length,
      required this.user,
      required this.onclick})
      : super(key: key);
  final int index;
  final int length;
  final User user;
  final OnClickUser onclick;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            onclick(user);
          },
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                maxRadius: 25,
                foregroundImage: AssetImage('${user.imgUrl}'),
              ),
              Positioned(
                bottom: 2,
                right: 1,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: user.online == true ? onlineColor : offlineColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2)),
                ),
              )
            ],
          ),
        ),
        index == length - 1
            ? const SizedBox(
                width: padding,
              )
            : const SizedBox()
      ],
    );
  }
}
