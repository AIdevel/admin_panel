import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:web_design/app/common/calender.dart';
import 'package:web_design/app/common/color_path.dart';
import 'package:web_design/app/common/image_path.dart';

import '../../../common/graph.dart';
import '../../../common/rating.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12.withAlpha(20),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Container - 1
          Container(

            width: Get.width * 0.2,
            height: Get.height * 1,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                // Logo - 8%
                Container(
                  padding: EdgeInsets.all(12.h),
                  alignment: Alignment.center,
                  height: Get.height * 0.08,
                  width: Get.width * 1,
                  color:Colors.white,
                  child: Image.asset(ImagePath.logo,
                  scale: 2,),
                ),
                divider(),

                //profile - 16%
                Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  height: Get.height * 0.16,
                  width: Get.width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                        ),

                        child: CircleAvatar(
                          backgroundImage: AssetImage(ImagePath.profile),
                          radius: 30.r,
                        ),
                      ),
                      Text("Pooja Mishra",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.sp),),
                      SizedBox(
                        height: Get.height * 0.04,
                        width: Get.width * 0.068,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.deepPurpleAccent)
                          ),
                            onPressed: (){}, child: Text("Admin",style: TextStyle(color: Colors.black,fontSize: 15.sp),)),
                      ),


                    ],
                  ),

                )
                ,divider(),

                //Menu - 35%
                Container(

                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    width: Get.width,
                    height: Get.height * 0.35,
                    color: Colors.white,
                    child: Obx(
                      ()=> ListView.separated(
                          itemCount: controller.menuList.length,
                          itemBuilder: (BuildContext context, int index) {
                            controller.isSelected.value = controller.isSelectedMenu.value == index;

                            return ElevatedButton(
                              onPressed: () {
                                if (controller.isSelected.value) {
                                  controller.isSelected.value = true;  // Keep selected
                                } else {
                                  controller.isSelectedMenu.value = index;  // Change selection
                                  controller.isSelected.value = false;  // Reset selected state
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: controller.isSelected.value ? Colors.black12.withAlpha(10) : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.zero,
                                    bottomRight: Radius.zero,
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                              ),
                              child: Row(
                                spacing: 40,
                                children: [
                                  Icon(
                                    controller.isSelected.value ? controller.menuListIcon[index]["icon1"] : controller.menuListIcon[index]["icon2"],
                                    color: controller.isSelected.value ? Colors.black : Colors.grey,
                                  ),
                                  Text(
                                    controller.menuList[index],
                                    style: TextStyle(
                                      fontSize: controller.isSelected.value ? 22.sp : 18.sp,
                                      fontWeight: controller.isSelected.value ? FontWeight.bold : FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(height: 10.h),
                        ),
                      ),

                    ),

                // Workspace - 6%
                Container(
                  width: Get.width*1,
                  height: Get.height * 0.06,
                  color: Colors.indigo.withAlpha(30),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Text('WORKSPACES',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 24.sp),),IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.black,size: 26.sp),)]
                )
                ),

            //Add Workshops - 22
                Container(
                  // padding: EdgeInsets.only(left: 20.w),
                  margin: EdgeInsets.only(top: 10.h,left: 100.w),
                  width: Get.width * 1,
                  height: Get.height * 0.2,

                  child: ListView.separated(itemCount: controller.workspaceItem.length,itemBuilder: (Builder,index)=>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        spacing: 60.sp,
                        children: [
                          Text(controller.workspaceItem[index],textAlign: TextAlign.right
                            ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18.sp),),
                          IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_rounded,size: 26.sp,color: Colors.black,))
                        ],
                      ),
                       separatorBuilder:(context,index)=>SizedBox(height:5.h), ),
                ),
                Flexible(
                  fit: FlexFit.tight,

                  child:Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Column(



                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(

                              spacing: 40.sp,
                              children: [
                                Icon(Icons.settings_outlined,size: 26.sp,),
                                Text("Setting",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20.sp),)
                              ],
                            ),
                          ),

                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17.0),
                            child: Row(
                              spacing: 40.sp,
                              children: [
                                Icon(Icons.logout,color: Colors.black,size: 26.sp,),
                                Text("Logout",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20.sp),)
                              ],
                            ),
                          ),

                        )
                      ],
                    ),
                  ) ,
                )
              ],
            ),
          ),
          Flexible(child: Column(
            children: [

              //Row
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: Get.height * 0.08,

                child: Row(

                  children: [
                    SizedBox(
                      width: Get.width * 0.59,
                      height: Get.height * 0.1,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal:20.w),child: Text("Home",style: TextStyle(color: Colors.grey),)),
                      Container(

                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        width: Get.width * 0.19,
                        height: Get.height * 0.055,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white,fontSize: 13),
                          decoration: InputDecoration(
                            fillColor: Color(0xff220c0c),


                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.white,fontSize: 16.sp),
                            suffixIcon: Icon(Icons.search,color: Colors.white,size: 20.sp,),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            )
                          ),
                        ),
                      ),

                                  ],
                      ),
                    ),
                    Row(children: [
                      leadingButton(text: Icons.message,),
                      leadingButton(text: Icons.notification_add,),
                      leadingButton(text: Icons.power_settings_new_outlined,)
                    ],),


                    SizedBox(width: 20.w,),



                    Container(
                      margin: EdgeInsets.only(left:Get.width * 0.045),
                      width: Get.width * 0.04,
                      height:Get.height * 0.05,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.brown,
                      ),
                      child:  Stack(fit: StackFit.expand,alignment: AlignmentDirectional.topCenter,children: [Image.asset(ImagePath.avatar)],),
                    )
                  ],
                ),

              ),

              Row(children: [

                // Middle part
                Flexible(
                  flex: 6,  // This means this container takes up 6 parts of the available space
                  child: SizedBox(
                    width: Get.width * 0.6,
                    height: Get.height * 0.92,
                    // color: Colors.green,
                    child:
                      Column(
                        children: [
                          // Top Rating Poster
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:25.w ,vertical:10.h ),
                            margin: EdgeInsets.symmetric(horizontal:8.w  ),

                            width: Get.width * 0.7,
                            height: Get.height * 0.32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(image:AssetImage(ImagePath.gradient ),fit:BoxFit.cover)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextAll(text: "ETHEREUM 2.0", weight: FontWeight.w400, size: 11,),
                                TextAll(text: "Top Rating\nProject", weight: FontWeight.bold, size: 22,),
                                TextAll(text: "Trending project and high rating \nProject Created by team.", weight: FontWeight.w200, size: 12,),
                                ElevatedButton(style:ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff160223),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))

                                ),onPressed:(){} , child: Text("Learn More.",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))

                              ],
                            ),
                          ),
                          Row(
                            children: [
                              //All project
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal:25.w ,vertical:10.h ),
                                  margin: EdgeInsets.symmetric(horizontal:8.w ,vertical: 5.h ),
                                  width: Get.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: ColorPath.cardColor,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  height:  Get.height * 0.3,

                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextAll(text: "All Projects", weight: FontWeight.w600, size: 12),
                                      SizedBox(height: 8.h,),
                                      Expanded(
                                        child: Obx(
                                            () => ListView.separated(scrollDirection: Axis.vertical,itemCount: controller.cardImage.length,itemBuilder: (context,index) {
                                              bool isSelected = controller.selectedIndex.value == index;
                                             return GestureDetector(
                                                onTap:(){
                                                  controller.selectItem(index);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(5.w),
                                                                                          width: Get.width*0.3,

                                                                                          decoration: BoxDecoration(
                                                color: isSelected?Colors.red[800]:Colors.black38,
                                                borderRadius: BorderRadius.circular(10.r),
                                                                                          ),
                                                                                          height: Get.height* 0.08,
                                                                                          child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  // icon
                                                  Container(

                                                    width:Get.width * 0.033,
                                                    height:Get.height * 0.065,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      image: DecorationImage(image:AssetImage(controller.cardImage[index]),fit: BoxFit.contain),
                                                    ),


                                                  ),
                                                  // Text Part
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      TextAll(text: "Technology Behind the Blockchain", weight: FontWeight.normal, size: 12),

                                                      RichText(text: TextSpan(style: TextStyle(color: isSelected?Colors.black87:Colors.grey,fontSize: 10),text: "Project #1  ",children: [TextSpan(style: TextStyle(color: Colors.white,fontSize: 10,decoration:TextDecoration.underline,decorationColor: Colors.white),text: ". See project details")]))
                                                    ],
                                                  ),

                                                  IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.white,size: 24.sp))
                                                ],

                                                                                          ),
                                                                                        ),
                                             ); } , separatorBuilder: (context,index)=>SizedBox(height: 5.w,)),
                                        ),
                                      )
                                    ],

                                                            ),),
                              ),

                              // Top Creators
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal:25.w ,vertical:10.h ),
                                  margin: EdgeInsets.symmetric(horizontal:8.w ,vertical: 5.h ),
                                  width: Get.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: ColorPath.cardColor,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  height:  Get.height * 0.3,

                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextAll(text: "Top Creators", weight:FontWeight.w600, size: 24.sp),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Name",style: TextStyle(color:Colors.grey),),
                                          Text("Artworks",style: TextStyle(color:Colors.grey),),
                                          Text("Rating",style: TextStyle(color:Colors.grey),),
                                        ],
                                      ),
                                      Expanded(
                                        child: ListView.separated(scrollDirection: Axis.vertical,itemCount:controller.profileName.length,itemBuilder: (context,index){
                                          return  Container(
                                              padding: EdgeInsets.all(5.w),
                                          width: Get.width*0.3,

                                          decoration: BoxDecoration(
                                          color: Colors.black38,
                                          borderRadius: BorderRadius.circular(10.r),
                                          ),
                                          height: Get.height* 0.07,
                                          child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                          // icon
                                          Container(

                                          width:Get.width * 0.033,
                                          height:Get.height * 0.065,
                                          decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(image:AssetImage(controller.profileImage[index]),fit: BoxFit.contain),
                                          ),
                                          ),
                                            RichText(text:TextSpan(text:  controller.profileName[index]["name"],style: TextStyle(color: Colors.white,fontSize: 14.sp),children: [TextSpan(text: controller.profileName[index]["art"],style: TextStyle(color: Colors.white,fontSize: 16.sp))]),


                                            ),
                                            RatingBar(rating:controller.profileName[index]["rating"] ),

                                          ],
                                          )
                                          );

                                        }, separatorBuilder: (context,index) => SizedBox(height: 5.h,),),
                                      )
                                    ],

                                  ),),
                              ),
                            ],
                          ),
                          //Graph
                          Container(
                            padding: EdgeInsets.all(15.w),
                            margin: EdgeInsets.only(top: 8.h),
                            color: Colors.white,
                            height: Get.height * 0.28,
                            width: Get.width * 0.59,
                            child: LineChartSample(),

                          )
                        ],
                      )
                  ),
                ),





                // last part
                Flexible(
                  flex: 2,  // This container takes up 2 parts of the available space
                  child: Container(
                    width: Get.width * 0.2,
                    height: Get.height * 0.92,
                    color: ColorPath.cardColor,
                    child: Column(
                      children: [
                        Padding(padding:EdgeInsets.symmetric(vertical: 10.h),child: TextAll(text: "GENERAL 10:00 AM TO 7:00 PM", weight: FontWeight.normal, size: 18.sp)),
                        //calender
                        Calender(),
                        //card
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                            color: Color(0x6e572c1b),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          width: Get.width * 0.18,
                          height:Get.height * 0.23,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(ImagePath.star,scale: 2,),
                                TextAll(text: "Today Birthday", weight: FontWeight.w600, size: 22.sp),
                                Image.asset(ImagePath.star,scale: 2,),
                              ],
                            ),
                            SizedBox(height: 10.h,),

                            Row(
                              spacing: 0,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[ cardAvatar(ImagePath.avatar1),
                                cardAvatar(ImagePath.avatar2),
                          ],
                            ),
                            SizedBox(height: 15.h,),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly
                                ,children: [
                            Text("Total",style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
                            Text("| 2 |",style: TextStyle(color: Colors.white,fontSize: 20.sp))]),
                            SizedBox(height: 5.h,),
                              SizedBox(
                                height: Get.height * 0.05,
                                width:Get.width * 0.5,

                                child: ElevatedButton(style:ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  backgroundColor: Color(0xffd30cc2),
                                ),onPressed: (){}, child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.telegram_outlined,color: Colors.white,),
                                    TextAll(text: 'Birthday Wishing', weight: FontWeight.w500, size: 12,)
                                  ],
                                )),
                              )
                          ],),
                        ),

                        //card-2
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          decoration: BoxDecoration(
                            color: Color(0x6e572c1b),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          width: Get.width * 0.18,
                          height:Get.height * 0.23,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(ImagePath.star,scale: 2,),
                                TextAll(text: "Anniversary", weight: FontWeight.w600, size: 22.sp),
                                Image.asset(ImagePath.star,scale: 2,),
                              ],
                            ),
                            SizedBox(height: 10.h,),

                            Row(
                              spacing: 0,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[ cardAnniversary(ImagePath.avatar1),
                                cardAnniversary(ImagePath.avatar2),
                                cardAnniversary(ImagePath.avatar2),

                              ],
                            ),
                            SizedBox(height: 15.h,),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly
                                ,children: [
                                  Text("Total",style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
                                  Text("| 3 |",style: TextStyle(color: Colors.white,fontSize: 20.sp))]),
                            SizedBox(height: 5.h,),
                            SizedBox(
                              height: Get.height * 0.05,
                              width:Get.width * 0.5,

                              child: ElevatedButton(style:ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                backgroundColor: Color(0xffd30cc2),
                              ),onPressed: (){}, child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.telegram_outlined,color: Colors.white,),
                                  TextAll(text: 'Anniversary Wishing', weight: FontWeight.w500, size: 12,)
                                ],
                              )),
                            )
                          ],),
                        ),



                        // Birthday Wish

                        // Anniversary Wish

                      ],
                    ),
                  ),
                ),
                ],
              ),




            ],
          ))

             ],
            ),



    );
  }

  Container cardAvatar(String image) {
    return Container(
                              alignment: Alignment.center,
                              width: Get.width * 0.06,
                              height: Get.height * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                shape: BoxShape.circle
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional.topEnd,

                                children: [Positioned(child:Image.asset(image,scale: 1.5,) ),Positioned(width:20.w,child: Image.asset(ImagePath.cake))],
                              ),
                            );
  }

  Container cardAnniversary(String image) {
    return Container(
      alignment: Alignment.center,
      width: Get.width * 0.06,
      height: Get.height * 0.06,
      decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,

        children: [Positioned(child:Image.asset(image,scale: 1.5,) )],
      ),
    );
  }

  Divider divider() {
    return Divider(
                color: ColorPath.dividerColor,
                height: 2.h,
                indent: 16.0.w,
                endIndent: 16.0.w,
              );
  }
}

class TextAll extends StatelessWidget {
  const TextAll({
    super.key, required this.text, required this.weight,required this.size
  });
 final String text;
 final FontWeight weight;
 final double size;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      color: Colors.white,fontWeight: weight,
      fontSize: size
    ),);
  }
}

class leadingButton extends StatelessWidget {
  const leadingButton({
    super.key, required this.text,
  });
  final IconData text;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){}, icon: Icon(text,color: Colors.black,size: 28.sp,),);
  }
}
