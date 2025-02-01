import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_design/app/common/image_path.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
RxInt isSelectedMenu =(-1).obs;
RxBool isSelected = false.obs;
RxList<Map<String,IconData>> menuListIcon = [{"icon1":Icons.home_filled,"icon2":Icons.home_outlined},{"icon1":Icons.group,"icon2":Icons.group_outlined},{"icon1":Icons.checklist,"icon2":Icons.checklist_outlined},{"icon1":Icons.calendar_month,"icon2":Icons.calendar_month_outlined},{"icon1":Icons.info,"icon2":Icons.info_outline}].obs;
  RxList menuList = ["Home","Employees","Attendance","Summary","Information"].obs;
  RxList workspaceItem = ["Adstacks","Finance"].obs;

  RxList<String> cardImage= [ImagePath.technology,ImagePath.tech,ImagePath.blockChain,ImagePath.technology,ImagePath.tech].obs;

  RxList<String> profileImage = [ImagePath.profile,ImagePath.profile1,ImagePath.profile2,ImagePath.profile3].obs;
  RxList<Map<String,dynamic>> profileName = [{"name":"@maddison_c21","art":'9821',"rating":3.0},{"name":"@karl.will02","art":'7032',"rating":2.0},{"name":"@maddison_c21","art":'9821',"rating":3.0},{"name":"@maddison_c21","art":'9821',"rating":3.0}].obs;


var selectedIndex = 0.obs; // Null means no item is selected

// Method to update the selected index
void selectItem(int index) {
  selectedIndex.value = index;
}
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
