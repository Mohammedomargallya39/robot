import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/di/injection.dart' as di;
import 'core/di/injection.dart';
import 'core/util/cubit/cubit.dart';
import 'core/util/cubit/state.dart';
import 'core/util/resources/bloc_observer_manager.dart';
import 'features/login/presentation/controller/login_cubit.dart';
import 'features/login/presentation/screens/splash_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  bool isRtl = false;



  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
     isRtl: isRtl,
    widget: const SplashScreen(),
    // token: token,
    // id: userId,
    // isCoach: isCoachLogin,
    // email:email,
  ));

}

class MyApp extends StatelessWidget {
   final bool isRtl;
   final Widget widget;
  // String? token;
  // bool? isCoach;
  // int? id;
  // String? email;

  const MyApp({
    Key? key,
     required this.isRtl,
     required this.widget,
    // required this.token,
    // required this.email,
    // required this.isCoach,
    // required this.id,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<AppBloc>()
            ..setThemes(
              rtl: isRtl,
            )
            ..connectivityListener(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        // BlocProvider(
        //   create: (context) => sl<HomeCubit>(),
        // ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Gymawy',
            debugShowCheckedModeBanner: false,
            themeMode:ThemeMode.light,
            theme: AppBloc.get(context).lightTheme,
            // initialRoute: Routes.splash,
            // routes: Routes.routes,
            home: widget,
          );
        },
      ),
    );
  }
}

