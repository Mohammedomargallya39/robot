import 'package:MAHR/core/util/resources/extensions_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../core/util/resources/assets.gen.dart';
import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/widgets/myButton.dart';
import '../../../../core/util/widgets/myText.dart';
import '../../../../core/util/widgets/myTextFill.dart';
import '../controller/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    HomeCubit homeCubit = HomeCubit.get(context);
    double batteryValue = 0.9;
    TextEditingController orderController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
              padding: designApp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50.rSp,
                        backgroundImage:
                        AssetImage(
                            Assets.images.svg.atef,
                        )
                      ),
                      horizontalSpace(5.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText(
                            title: 'Samurai',
                            style: Style.small,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.rSp,
                          ),
                          myText(
                            title: 'Admin',
                            style: Style.small,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.rSp,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: ()
                        async  {
                          await launchUrlString('mailto:mohammedatef1969@gmail.com');
                          },
                          icon: const Icon(Icons.help),
                          color: ColorsManager.darkGrey,
                      )
                    ],
                  ),
                  verticalSpace(4.h),
                  Row(
                    children: [
                      myText(
                          title: 'Battery',
                          style: Style.medium,
                          fontSize: 24.rSp,
                          fontWeight: FontWeight.w600,
                      ),
                      horizontalSpace(10.w),
                      myText(
                        title: '${(batteryValue * 100).toInt()}%',
                        style: Style.medium,
                        fontSize: 16.rSp,
                      ),
                    ],
                  ),
                  verticalSpace(1.h),
                  LinearProgressIndicator(
                    value: batteryValue,
                    valueColor: batteryValue >= 0.3 ? batteryValue <= 0.8 && batteryValue >=0.3 ? const AlwaysStoppedAnimation<Color>(Colors.green) :  const AlwaysStoppedAnimation<Color>(Colors.greenAccent) : const AlwaysStoppedAnimation<Color>(Colors.red),
                    // color: Colors.grey,
                     backgroundColor: Colors.grey,
                     minHeight: 1.5.h,
                  ),
                  verticalSpace(4.h),
                  myText(
                    title: 'Suggestion Tasks',
                    style: Style.medium,
                    fontSize: 24.rSp,
                    fontWeight: FontWeight.w600,
                  ),
                  verticalSpace(3.h),
                  SizedBox(
                    height: 21.h,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      padEnds: false,
                      controller: PageController(
                        initialPage: homeCubit.selected,
                        viewportFraction: 0.45,
                        keepPage: true,
                      ),
                      allowImplicitScrolling: true,
                      pageSnapping: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Container(
                              margin: EdgeInsets.all(9.rSp),
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  // selected == index ?
                                  BoxShadow(
                                    color: Color.fromARGB(255, 1, 196, 251),
                                    spreadRadius: 0,
                                    blurRadius: 8,
                                  )
                                  // : const BoxShadow(),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                // border: Border.all(color: Colors.orange),
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    ColorsManager.whiteColor,
                                    ColorsManager.whiteColor,
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.rSp),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        homeCubit.listSuggestions[index].img,
                                        height: 11.h,
                                        color: Colors.black.withOpacity(0.6),
                                    ),
                                    verticalSpace(2.h),
                                    myText(
                                      title: homeCubit.listSuggestions[index].title,
                                      style: Style.extraSmall,
                                      color: Colors.black,
                                      fontSize: 12.rSp,
                                      maxLines: 1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            if (index == 0) {
                            } else if (index == 1) {
                            } else if (index == 2) {
                            } else if (index == 3){
                            }else{
                            }
                          },
                        );
                      },
                      itemCount: homeCubit.listSuggestions.length,
                    ),
                  ),
                  verticalSpace(6.h),
                  myTextFill(
                    isPassword: false,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'isEmpty';
                      }
                      return null;
                    },
                    controller: orderController,
                    hint: 'Order',
                    suffixIcon: IconButton(
                        onPressed: ()
                        {
                          
                        }, 
                        icon: const Icon(Icons.send),
                        color: const Color.fromARGB(255, 1, 196, 251),
                    ),
                  ),
                  verticalSpace(6.h),
                  myButton(
                      text: 'Speak',
                       onPressed: ()
                       {

                       },
                      textOnly: false,
                    elevation: 10.rSp,
                    radius: 10.rSp,
                       color: const Color.fromARGB(255, 1, 196, 251),
                        iconWidget: SvgPicture.asset(
                            Assets.images.svg.call,
                            color: Colors.white,
                            height: 4.h,
                        ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
