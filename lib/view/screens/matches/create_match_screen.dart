import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/view/provider/match_provider.dart';
import 'package:tdm_user_app/view/screens/auth/login_screen.dart';
import 'package:tdm_user_app/view/widgets/c_button.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class CreateMatchScreen extends StatelessWidget {
  const CreateMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matchPro = Provider.of<MatchProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff48245D),
              Color.fromARGB(188, 49, 15, 185),
              Color(0xff540062)
            ])),
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: matchPro.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios_new)),
                        const Spacer(),
                        const HeadingText(text: "Create Match"),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    HeadingTextField(
                      controller: matchPro.nameController,
                      heading: "Name",
                      hint: "TDM Name",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Enter Name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HeadingTextField(
                      controller: matchPro.priceController,
                      heading: "Price",
                      hint: "TDM Price",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Enter Price";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: HeadingTextField(
                              controller: matchPro.idPassTimeController,
                              heading: "ID PASS Time",
                              hint: "3:00",
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Enter Time";
                                }
                                return null;
                              },
                            ),
                          ),
                          const Icon(Icons.timer),
                          Expanded(
                            child: HeadingTextField(
                              controller: matchPro.startTimeController,
                              heading: "Start Time",
                              hint: "3:15",
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Enter Time";
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        HeadingText(
                          text: "Room ID & PASS",
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.info)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HeadingTextField(
                      hint: "Room ID",
                      heading: "ID",
                      controller: matchPro.roomIDController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HeadingTextField(
                      hint: "Room Password",
                      heading: "PASS",
                      controller: matchPro.roomPassController,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: CustomButton(
                        isLoading: matchPro.isLoading,
                        label: "Create",
                        onPressed: () {
                          if (matchPro.formKey.currentState!.validate()) {
                            matchPro.onCreateMatch();
                          }
                        },
                        backgroundColor: Colors.green,
                        width: 200,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class HeadingTextField extends StatelessWidget {
  final String heading;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const HeadingTextField(
      {super.key,
      required this.hint,
      required this.heading,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingText(text: heading),
        const SizedBox(
          height: 15,
        ),
        CustomTextfield(
          controller: controller,
          hint: hint,
          bgColor: const Color.fromARGB(255, 255, 255, 255),
          validator: validator,
        )
      ],
    );
  }
}
