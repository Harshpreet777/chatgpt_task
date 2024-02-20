import 'dart:convert';

import 'package:chatgpt_api/constants/color_constant.dart';
import 'package:chatgpt_api/models/response_model.dart';
import 'package:chatgpt_api/services/post_data_service.dart';
import 'package:flutter/material.dart';

class ChatGPT3Screen extends StatefulWidget {
  const ChatGPT3Screen({super.key});

  @override
  State<ChatGPT3Screen> createState() => _ChatGPT3ScreenState();
}

class _ChatGPT3ScreenState extends State<ChatGPT3Screen> {
  late TextEditingController messageController;
  String message = '';
  final List<MessageModel> message2 = [];
  bool isSender = true;

  Future<void> chats() async {
    if (messageController.text.isNotEmpty) {
      final response = await PostApiService.postData(messageController.text);
      setState(() {
        isSender = true;
        message = messageController.text;
        message2.add(MessageModel(message: message, type: "sender"));
      });
      final jsonResponse = json.decode(response);
      if (jsonResponse.containsKey("choices")) {
        final choices = jsonResponse["choices"];
        if (choices.isNotEmpty) {
          final text = choices[0]["text"];
          setState(() {
            isSender = false;
            message2.add(MessageModel(message: text, type: "bot"));
          });
        }
      }

      messageController.clear();
    }
  }

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                transform: const GradientRotation(6.1),
                stops: const [0.1, 0.35],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConstant.gradientBlue,
                  ColorConstant.gradientBlack
                ])),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: message2.length,
                itemBuilder: (context, index) {
                  MessageModel messages = message2[index];
                  return Align(
                    alignment: messages.type == 'sender'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          color: messages.type == 'sender'
                              ? ColorConstant.purple
                              : ColorConstant.blue1e1a47,
                          child: Row(
                            mainAxisAlignment: messages.type == 'sender'
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              messages.type == 'sender'
                                  ? Container()
                                  : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image.asset(
                                            'assets/images/Vector.png')),
                                  ),
                              Flexible(
                                child: Text(
                                  messages.type == 'sender'
                                      ? messages.message
                                      : messages.message.trimLeft(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: messageController,
                onEditingComplete: () async {
                  chats();
                },
                onTap: () async {
                  chats();
                },
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorConstant.blue1e1a47,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: InkWell(
                          onTap: null,
                          child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: ColorConstant.purple),
                              child: Image.asset(
                                'assets/images/arrow.png',
                                fit: BoxFit.cover,
                              ))),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(color: Colors.white24)),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(width: 2, color: Colors.white))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
