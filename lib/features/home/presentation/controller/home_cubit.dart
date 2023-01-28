import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/resources/appString.dart';
import '../../../../core/util/resources/assets.gen.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeStates> {

  HomeCubit() :super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int selected = 0;
  List<Suggestions> listSuggestions = [
    Suggestions(
      title: 'Switch Lights',
      img: Assets.images.svg.light,
    ),
    Suggestions(
      title: 'Get my bag',
      img: Assets.images.svg.bag,
    ),
    Suggestions(
      title: 'Bring Groceries',
      img: Assets.images.svg.gro,
    ),
    Suggestions(
      title: 'Bring a glass of water',
      img: Assets.images.svg.glass,
    ),
  ];

}


class Suggestions extends Equatable {
  final String img;
  final String title;

  const Suggestions({required this.img, required this.title});

  @override
  List<Object?> get props => [img, title];
}