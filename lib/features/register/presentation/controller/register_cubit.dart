import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/widgets/myText.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {

  RegisterCubit() :super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  String selectedTypeFamily = 'Parent';
  List<DropdownMenuItem<String>>? typeValue = const[
    DropdownMenuItem(value: "Parent", child: myText(title: "Parent", style: Style.extraSmall)),
    DropdownMenuItem(value: "Child", child: myText(title: "Child", style: Style.extraSmall)),
    DropdownMenuItem(value: "Grand", child: myText(title: "Grand Parent", style: Style.extraSmall)),
  ];

  void changeDropDownSelectedDay(String value){
    selectedTypeFamily = value;
    emit(ChangeDropDownSelectedValueState());
  }

}
