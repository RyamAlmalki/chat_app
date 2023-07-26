import 'package:chatapp/models/conversation.dart';
import 'package:chatapp/models/user.dart';
import 'package:flutter/material.dart';
import '../../../shared/const.dart';
import 'package:chatapp/screens/home/message_screen.dart';
import 'package:intl/intl.dart';

class ConversationTile extends StatelessWidget {
  ConversationTile({super.key, required this.conversation, this.user});
  Conversation conversation;
  ChatUser? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: ListTile(
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(conversation.lastMessage, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.normal, fontSize: 15),),
              conversation.numberOfUnseenMessages != 0 ? CircleAvatar(
                radius: 10,
                backgroundColor: primaryColor, 
                child:  Padding(
                  padding:  EdgeInsets.all(1.0),
                  child:  Text('${conversation.numberOfUnseenMessages}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ) : CircleAvatar(backgroundColor: background, radius: 10,),
            ],
          ),
        ), 
        tileColor: background,
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${conversation.fullName}', style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18),),
            Text(DateFormat('EEEE').format(conversation.date), style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18),),
          ],
        ),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  MessageScreen(chatId: conversation.id, user: user, numberOfUnseenMessages: conversation.numberOfUnseenMessages,)),
          );
        },
      ),
    );
  }
}