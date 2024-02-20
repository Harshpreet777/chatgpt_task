import 'package:chatgpt_api/constants/color_constant.dart';
import 'package:chatgpt_api/screens/chatgpt_3.5_screen.dart';
import 'package:chatgpt_api/screens/chatgpt_4.0_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Container(
          height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                transform: const GradientRotation(6.1),
                stops: const [0.1, 0.25],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConstant.gradientBlue,
                  ColorConstant.gradientBlack
                ])),
          child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                backgroundColor: ColorConstant.gradientBlue,
                title: const Text('ChatGPT',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500)),
                bottom: const TabBar(indicatorColor: Colors.white, tabs: [
                  Tab(
                    child: Text(
                      'ChatGPT(3.5)',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'ChatGPT(4.0)',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ])),
            body: const TabBarView(
                children: [ChatGPT3Screen(), ChatGPT4Screen()]),
          ),
        ),
      ),
    );
  }
}
