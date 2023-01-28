import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() :super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

}
