import 'package:breakaway/models/msg_model.dart';
import 'package:breakaway/widgets/other_msg.dart';
import 'package:breakaway/widgets/own_msg.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GroupChat extends StatefulWidget {
  final String title;
  final String userid;
  const GroupChat({super.key, required this.title, required this.userid});

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  IO.Socket? socket;
  List<MsgModel> listMsg = [];
  TextEditingController msgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io("https://localhost:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();

    socket!.onConnect((_) {
      print('connect into frontend');
      socket!.on("sendMsgServer", (msg) {
        print(msg);
        setState(() {
          if (msg["userid"] != widget.userid) {
            listMsg.add(
              MsgModel(
                type: msg["type"],
                msg: msg["msg"],
                sender: msg["senderName"],
              ),
            );
          }
        });
      });
    });
  }

  void sendMsg(String msg, String senderName) {
    MsgModel ownmsg = MsgModel(type: "ownMsg", msg: msg, sender: senderName);
    listMsg.add(ownmsg);
    setState(() {
      listMsg;
    });
    socket!.emit('sendmsg', {
      "type": "ownMsg",
      "msg": msg,
      "senderName": senderName,
      "userId": widget.userid,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (listMsg[index].type == "ownMsg") {
                  return OwnMsg(msg: listMsg[index].msg, sender: "me");
                } else {
                  return OtherMsg(msg: listMsg[index].msg, sender: "user");
                }
              },
              itemCount: listMsg.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: msgController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMsg(msgController.text, "user");
                    msgController.clear();
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
