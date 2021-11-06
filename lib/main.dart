import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/main_cubit/main_cubit.dart';
import 'package:news_app/shared/main_cubit/main_states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio.dart';
import 'package:news_app/shared/styles/themes.dart';
import 'layouts/news_app/news_layout.dart';

void main() async {

  // بيتأكد ان كل حاجة اشتفلت قبل ما يرن الابليكيشين
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark ?? false));
}

class MyApp extends StatelessWidget {

  final bool isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => MainAppCubit()..changeMode(fromShared: isDark),),
        BlocProvider(create: (BuildContext context) => AppCubit()..getBusiness()..getSports()..getScience()),
      ],

      child: BlocConsumer<MainAppCubit,MainStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme : lightTheme,

            darkTheme : darkTheme,

            themeMode: MainAppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,

            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
