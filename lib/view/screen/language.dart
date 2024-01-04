import 'package:e_commerce_app/core/localization/change_local.dart';
import 'package:e_commerce_app/view/widget/drop_down_search.dart';
import 'package:e_commerce_app/view/widget/language/custom_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drop_down_list/model/selected_list_item.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "chooseLang".tr,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomDropDownSearch(
                title:  "chooseLang".tr,
                dataList: [
                  SelectedListItem(name: "English",value: "English"),
                  SelectedListItem(name: "Arabic",value: "Arabic"),
                ],
                dropDownSelectedNameController:controller.languageTextController! ,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtonLang(
              onPressed: () {
                controller.changeLang2();
                //controller.goToLogin();
              },
              text: "Continue".tr,
            ),

          ],
        ),
      ),
    );
  }
}
