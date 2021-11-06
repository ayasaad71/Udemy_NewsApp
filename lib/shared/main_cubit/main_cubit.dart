import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/main_cubit/main_states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class MainAppCubit extends Cubit <MainStates> {
  MainAppCubit() : super(MainInitState());

  static MainAppCubit get(context) => BlocProvider.of(context);

  bool isDark = false ;

  void changeMode({bool? fromShared}){

    if (fromShared != null){
      isDark = fromShared ;
      emit(ChangeModeState());

    }
    else{
      isDark = !isDark ;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeState());

      });
    }

  }
}