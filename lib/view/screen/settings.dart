import 'package:e_commerce_app/controller/setting_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return GetBuilder<SettingController>(
      builder: (controller) {
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll){
            overScroll.disallowIndicator();
            return true;
          },
          child: ListView(
            children: [
              Text("Settings".tr, style: const TextStyle(color: AppColors.black,fontSize: 25)),
              const SizedBox(height: 16),
              _buildListTile('2'.tr, Icons.dark_mode, controller.theme!.tr, Colors.purple, onTab: () =>controller.showAppearanceModal()),
              const Divider(color: AppColors.black),
              _buildListTile('1'.tr, Icons.language, controller.language!.tr, Colors.orange, onTab: ()=>controller.showLanguageModal()),
              const Divider(color: AppColors.black),
              _buildListTile('Orders'.tr, Icons.list_alt, "", Colors.deepOrange, onTab: ()=>controller.goToOrdersScreen()),
              const Divider(color: AppColors.black),
              _buildListTile('Addresses'.tr, Icons.location_on, '', Colors.pink, onTab: ()=>controller.goToAddressScreen()),
              const Divider(color: AppColors.black),
              ListTile(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withAlpha(30)
                  ),
                  child: const Center(
                    child: Icon(Icons.notifications_none_outlined, color: Colors.blue,),
                  ),
                ),
                title: Text("Notifications".tr, style: const TextStyle(color: AppColors.black,fontSize: 17)),
                trailing: Switch(
                    value: controller.notification,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value){
                      controller.changeNotification();
                }),
              ),
              const Divider(color: AppColors.black),
              _buildListTile('Help Center'.tr, Icons.help, '', Colors.green, onTab: () {}),
              const Divider(color: AppColors.black),
              _buildListTile('Logout'.tr, Icons.exit_to_app, '', Colors.red,
                  onTab: (){
                    Get.defaultDialog(
                      title: "Information".tr,
                      middleText: "Do you want to log out".tr,
                      actions: <Widget>[
                        TextButton(
                          child: Text("Yes".tr),
                          onPressed: () {
                            controller.logOut();
                          },
                        ),
                        TextButton(
                          child: Text("Close".tr),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    );
                  }
              ),
              const Divider(color: AppColors.black),
              const SizedBox(height: 20,),

            ],
          ),
        );
      }
    );

  }
}

Widget _buildListTile(String title, IconData icon, String trailing, Color color, {onTab}) {
  return ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withAlpha(30)
        ),
        child: Center(
          child: Icon(icon, color: color,),
        ),
      ),
      title: Text(title, style: const TextStyle(color: AppColors.black,fontSize: 17)),
      trailing: SizedBox(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(trailing, style: const TextStyle(color: AppColors.lightGery,fontSize: 17)),
            const Icon(Icons.arrow_forward_ios, size: 16,),
          ],
        ),
      ),
      onTap: onTab
  );
}
