import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/util/resources/assets.gen.dart';
import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/resources/extensions_manager.dart';
import '../../../../core/util/widgets/myButton.dart';
import '../../../../core/util/widgets/myText.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   // Timer(const Duration(seconds: 2),() {
    //   // });
    //   // navigateAndFinish(context,LoginScreen());
    //
    // });
    ScreenSizes.screenHeight = MediaQuery.of(context).size.height;
    ScreenSizes.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
            width: double.infinity,
            child: Image.asset(
                Assets.images.svg.icon,
                fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: designApp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 33,
                  backgroundColor: const Color.fromARGB(255, 1, 196, 251),
                  child: SvgPicture.asset(Assets.images.svg.robot),
                ),
                verticalSpace(2.h),
                myText(
                    title: 'Bot MAHR',
                    style: Style.medium,
                    fontSize: 26.rSp,
                    color: ColorsManager.white.withOpacity(0.7),
                    fontWeight: FontWeight.w600,
                ),
                myText(
                  title: 'A manipulation robot that can assist with household chores in your hands just with a touch.',
                  style: Style.small,
                  fontSize: 18.rSp,
                  color: ColorsManager.white.withOpacity(0.3),
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: designApp,
            child: myButton(
                text: 'Get started!',
                color: const Color.fromARGB(255, 1, 196, 251),
                elevation: 10.rSp,
                radius: 10.rSp,
                onPressed: ()
                {
                  navigateAndFinish(context, LoginScreen());
                },
            ),
          ),
        ],
      ),
    );
  }
}
