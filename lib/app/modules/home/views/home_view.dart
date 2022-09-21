import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../gridview_screen/views/gridview_screen_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  //  final RxInt value = homeController.columns.obs;
  final formkey = GlobalKey<FormState>();
  final formkeynext = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //  final  width=Get.width;
    //     final  height= Get.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: const SizedBox(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: homeController.noOfRowController,
                        labelext: "NO OF ROW",
                        validator: (value) {
                          if (value == " " || value!.isEmpty) {
                            return "Enter a number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                          keyboardType: TextInputType.number,
                          controller: homeController.noOfColumController,
                          labelext: "NO OF COLUMN",
                          validator: (value) {
                            if (value == "" || value!.isEmpty) {
                              return "enter a number ";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              homeController.updateLetters();
                            }
                          },
                          child: const Text("NEXT"))
                    ],
                  ),
                ),
              ),
              GetBuilder<HomeController>(builder: (context) {
                return Visibility(
                  visible: homeController.displayValue.value,
                  child: Form(
                    key: formkeynext,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: GetBuilder<HomeController>(builder: (context) {
                        return Column(
                          children: [
                            Text(
                              "No of Alphabet Should be entered ${homeController.columns.value}",
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                                keyboardType: TextInputType.text,
                                controller: homeController.alphabetController,
                                count: homeController.columns.toInt(),
                                validator: (value) {
                                  if (value!.isEmpty || value == '') {
                                    return "Enter the Alphabets";
                                  } else if (value.length !=
                                      homeController.columns.toInt()) {
                                    return "Check the count";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (formkeynext.currentState!.validate()) {
                                    Get.to(() => (GridviewScreenView(
                                          alphabets: homeController
                                              .alphabetController.text,
                                          columns:
                                              homeController.columns.toInt(),
                                          rows: homeController.rows!,
                                        )));
                                  }
                                },
                                child: const Text("Enter"))
                          ],
                        );
                      }),
                    ),
                  ),
                );
              }),
            ],
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.labelext,
    required this.validator,
    this.count,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String? labelext;
  final FormFieldValidator<String> validator;
  final int? count;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      maxLength: count,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: labelext,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
