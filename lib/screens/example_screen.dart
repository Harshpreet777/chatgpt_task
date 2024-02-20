import 'package:chatgpt_api/constants/color_constant.dart';
import 'package:chatgpt_api/constants/string_constant.dart';
import 'package:chatgpt_api/screens/create_your_account_screen.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // tileMode: TileMode.repeated,
                // tileMode: TileMode.mirror,
                transform: const GradientRotation(6.1),
                stops: const [0.1, 0.35],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConstant.gradientBlue,
                  ColorConstant.gradientBlack
                ])),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 90,
                ),
                SizedBox(
                  height: 50,
                  child: Image.asset(
                    'assets/images/Vector.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  StringConstant.title,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  StringConstant.subtittle,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.light_mode_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  StringConstant.example,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: StringConstant.stringList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: const BoxDecoration(
                          color: ColorConstant.blue1e1a47,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text(
                          StringConstant.stringList[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(
                                horizontal: 150, vertical: 10)),
                        shape: const MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        backgroundColor:
                            MaterialStatePropertyAll(ColorConstant.purple)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => const CreateYourAccountScreen(), ));
                    },
                    child: Text(
                      StringConstant.buttonText2,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
