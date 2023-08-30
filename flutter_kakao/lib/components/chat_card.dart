import 'package:flutter/material.dart';
import 'package:flutter_kakao/models/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;

  const ChatCard({required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          //row는 넓이가 있는데 높이가 없다 . 높이를 잡아줘야 화면에 표현이된다.
          children: [
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                //기본 패딩 없애기
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(chat.image),
                ),
                title: Text(
                  chat.title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                subtitle: Text(chat.content),
              ),
            ),
            Column(
              children: [
                Text(chat.time,
                    style: TextStyle(color: Color(0xFFa5a5a5), fontSize: 12)),
                SizedBox(height: 5),
                chat.count != "0"
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFde6344),
                        ),
                        child: Text(
                          chat.count,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      )
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
