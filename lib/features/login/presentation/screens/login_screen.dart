import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:robot/core/util/resources/extensions_manager.dart';
import '../../../../core/util/cubit/cubit.dart';
import '../../../../core/util/cubit/state.dart';
import '../../../../core/util/resources/appString.dart';
import '../../../../core/util/resources/assets.gen.dart';
import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/widgets/hideKeyboard.dart';
import '../../../../core/util/widgets/myButton.dart';
import '../../../../core/util/widgets/myText.dart';
import '../../../../core/util/widgets/myTextFill.dart';
import '../controller/login_cubit.dart';
import '../controller/login_states.dart';


class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {});

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        // /// Show Error Message مش بيخش الايرور ستيت اساسا
        //  if(state is LoginErrorState){
        //   designToastDialog(context: context, toast: TOAST.error,text: state.failure.toString());
        // }
      },
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        AppBloc appBloc = AppBloc.get(context);
        return BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Scaffold(
              body: HideKeyboardPage(
                child: SafeArea(
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Center(
                        child: Padding(
                          padding: designApp,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  Assets.images.svg.robot,
                                  height: 25.h,
                                  color: const Color.fromARGB(255, 1, 196, 251),
                              ),
                              verticalSpace(5.h),
                              Text(
                                'Welcome to your assistant',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                  fontFamily: 'splash',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 30.rSp,
                                ),
                              ),
                              verticalSpace(5.h),
                              myTextFill(
                                isPassword: false,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'isEmpty';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                hint: AppString.email,
                                svgImg: Assets.images.svg.email,
                              ),
                              myTextFill(
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'isEmpty';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                hint: AppString.password,
                                isPassword: appBloc.showPassword,
                                svgImg: Assets.images.svg.lock,
                                suffixIcon: IconButton(
                                  icon: Icon(appBloc.visibilityShowPassword),
                                  onPressed: (){
                                    appBloc.changePasswordVisibility();
                                  },
                                ),
                              ),
                              verticalSpace(2.h),
                              myButton(
                                  elevation: 0.0,
                                  textOnly: false,
                                  iconWidget: svgImage(
                                    path: Assets.images.svg.login,
                                    color: ColorsManager.white,
                                  ),
                                  color: const Color.fromARGB(255, 1, 196, 251),
                                  height: 3.h,
                                  text: AppString.login,

                                  onPressed: () async{
                                    if(formKey.currentState!.validate())
                                    {
                                    }
                                    else
                                    {
                                      designToastDialog(
                                          context: context,
                                          toast: TOAST.warning,
                                          text: 'please fill ur data');
                                    }

                                  }),
                              verticalSpace(5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const myText(title: AppString.dont_have_account, style: Style.extraSmall),
                                  // space10Horizontal,
                                  TextButton(
                                    onPressed: () {},
                                    child: const myText(
                                      title: AppString.signUp,
                                      style: Style.extraSmall,
                                      color: Color.fromARGB(255, 1, 196, 251),
                                      fontWeight: FontWeight.w600,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
