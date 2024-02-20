import 'package:chatgpt_api/services/get_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatGPT4Screen extends StatefulWidget {
  const ChatGPT4Screen({super.key});

  @override
  State<ChatGPT4Screen> createState() => _ChatGPT4ScreenState();
}

class _ChatGPT4ScreenState extends State<ChatGPT4Screen> {
 late TextEditingController messageController;
  String message = '';
  bool isTyping=true;
  @override
  void initState() {
    messageController=TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: Container()),
          Text(
            message.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          if(isTyping)...{
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 20,
            )
          },
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: TextFormField(
              onEditingComplete: () {
                setState(() {
                  message=messageController.text.toString();
                });
              },
              controller: messageController,
              onTap: () async{
                await GetApiService.getData();
                setState(() {
                  message = messageController.text.toString();
                });
              },
              cursorColor: Colors.white,
              style:const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                
                  suffixIcon: Icon(Icons.send, color: Colors.white, size: 25),
                  hintText: 'Message ChatGPT',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.white70),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      borderSide: BorderSide(color: Colors.white70)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      borderSide: BorderSide(color: Colors.white70)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      borderSide: BorderSide(width: 2, color: Colors.white))),
            ),
          )
        ],
      ),
    );
  }
}
