import 'package:chatgpt_api/constants/color_constant.dart';
import 'package:chatgpt_api/constants/string_constant.dart';
import 'package:chatgpt_api/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CreateYourAccountScreen extends StatefulWidget {
  const CreateYourAccountScreen({super.key});

  @override
  State<CreateYourAccountScreen> createState() =>
      _CreateYourAccountScreenState();
}

class _CreateYourAccountScreenState extends State<CreateYourAccountScreen> {
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.8,
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
                  StringConstant.createAccTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    StringConstant.createAccSubTitle,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        fillColor: ColorConstant.blue1e1a47,
                        filled: true,
                        hintText: StringConstant.textFormText,
                        hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)))),
                            backgroundColor:
                                MaterialStatePropertyAll(ColorConstant.purple)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        },
                        child: Text(
                          StringConstant.continueBtnText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: StringConstant.createAccMsg,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                      TextSpan(
                          text: StringConstant.createAccMsg2,
                          style: const TextStyle(
                              color: ColorConstant.blue4F378B,
                              fontSize: 15,
                              fontWeight: FontWeight.w400))
                    ]),
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    ),
                    Text(
                      StringConstant.or,
                      style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: ColorConstant.blue1e1a47),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/google.png',
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            StringConstant.google,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: ColorConstant.blue1e1a47),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/microsoft.png',
                            fit: BoxFit.contain,
                          ),
                          title: Text(
                            StringConstant.microsoft,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
