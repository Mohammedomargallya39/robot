import 'package:MAHR/core/util/resources/extensions_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import '../controller/register_cubit.dart';
import '../controller/register_states.dart';


class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emergencyContactController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {});

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        // /// Show Error Message مش بيخش الايرور ستيت اساسا
        //  if(state is LoginErrorState){
        //   designToastDialog(context: context, toast: TOAST.error,text: state.failure.toString());
        // }
      },
      builder: (context, state) {
        RegisterCubit registerCubit = RegisterCubit.get(context);
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
                              defaultAppBar(
                                  title: 'Sign Up',
                                  context: context
                              ),
                              SvgPicture.asset(
                                  Assets.images.svg.robot,
                                  height: 25.h,
                                  color: const Color.fromARGB(255, 1, 196, 251),
                              ),
                              // verticalSpace(5.h),
                              // Text(
                              //   'Welcome to your assistant',
                              //   style: Theme
                              //       .of(context)
                              //       .textTheme
                              //       .displayLarge!
                              //       .copyWith(
                              //     fontFamily: 'splash',
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 30.rSp,
                              //   ),
                              // ),
                              verticalSpace(5.h),
                              myTextFill(
                                isPassword: false,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'isEmpty';
                                  }
                                  return null;
                                },
                                controller: fullName,
                                hint: AppString.fullName,
                                svgImg: Assets.images.svg.person,
                              ),
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
                                isPassword: false,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'isEmpty';
                                  }
                                  return null;
                                },
                                controller: phoneController,
                                hint: AppString.phone,
                                svgImg: Assets.images.svg.phone,
                                type: TextInputType.phone,
                              ),
                              myTextFill(
                                isPassword: false,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'isEmpty';
                                  }
                                  return null;
                                },
                                controller: emergencyContactController,
                                hint: 'Emergency Contact',
                                svgImg: Assets.images.svg.phone,
                                type: TextInputType.phone,
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
                                  icon: Icon(appBloc.visibilityShowPassword,
                                  color: const Color.fromARGB(255, 1, 196, 251),),
                                  onPressed: (){
                                    appBloc.changePasswordVisibility();
                                  },
                                ),
                              ),
                              myTextFill(
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'isEmpty';
                                  }
                                  return null;
                                },
                                controller: confirmPasswordController,
                                hint: AppString.confirm_password,
                                isPassword: appBloc.showPassword,
                                svgImg: Assets.images.svg.lock,
                              ),
                              verticalSpace(2.h),
                              DropdownButton(
                                isExpanded: true,
                                value: registerCubit.selectedTypeFamily,
                                items: registerCubit.typeValue,
                                onChanged: (value) {
                                  registerCubit.changeDropDownSelectedDay(value!);
                                  debugPrintFullText('second  value  is =$value');
                                  debugPrintFullText(
                                      'second is =${registerCubit.selectedTypeFamily}');
                                },
                              ),
                              verticalSpace(4.h),
                              myButton(
                                  elevation: 10.rSp,
                                  radius: 10.rSp,
                                  textOnly: false,
                                  iconWidget: svgImage(
                                    path: Assets.images.svg.login,
                                    color: ColorsManager.white,
                                  ),
                                  color: const Color.fromARGB(255, 1, 196, 251),
                                  height: 3.h,
                                  text: AppString.signUp,

                                  onPressed: () async{
                                    if(formKey.currentState!.validate())
                                    {
                                      if(confirmPasswordController.text == passwordController.text)
                                      {
                                        Navigator.pop(context);
                                      } else
                                      {
                                        designToastDialog(
                                            context: context,
                                            toast: TOAST.error,
                                            text: 'password and confirm password must be the same');
                                      }
                                    }
                                    else
                                    {
                                      designToastDialog(
                                          context: context,
                                          toast: TOAST.error,
                                          text: 'please fill ur data');
                                    }

                                  }),
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
