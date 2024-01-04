
import 'package:e_commerce_app/controller/test_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
         return HandlingDataView(
              requestStatus: controller.requestStatus,
              widget: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(controller.data[index].toString());
                },
                itemCount: controller.data.length,
              ),
          );
      },
      ),
    );
  }
}
