import 'package:chatgpt_api/constants/color_constant.dart';
import 'package:chatgpt_api/constants/string_constant.dart';
import 'package:chatgpt_api/screens/example_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                left: 126,
                top: 180,
                child: Image.asset(
                  'assets/images/Vector.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 380,
                left: 38,
                child: Text(
                  StringConstant.welcome,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.fontColorPink),
                ),
              ),
              Positioned(
                top: 430,
                left: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      StringConstant.welcomeMsg,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorConstant.fontColorPink),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 45,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 20)),
                          shape: const MaterialStatePropertyAll(
                              ContinuousRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)))),
                          side: MaterialStatePropertyAll(BorderSide(
                              color: ColorConstant.fontColorPink, width: 3)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Colors.transparent)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExampleScreen(),
                            ));
                      },
                      child: Row(
                        children: [
                          Text(
                            StringConstant.buttonText,
                            style: TextStyle(
                                color: ColorConstant.fontColorPink,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: ColorConstant.fontColorPink,
                            size: 30,
                          )
                        ],
                      )))
            ],
          )
        ],
      ),
    );
  }
}
