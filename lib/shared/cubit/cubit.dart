import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/news_app/business/business_screen.dart';
import 'package:news_app/modules/news_app/science/science_screen.dart';
import 'package:news_app/modules/news_app/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio.dart';

class AppCubit extends Cubit <AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context) ;

  int currentIndex = 0 ;

  List <Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List <BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
  ];

  void changeIndex(index) {
    currentIndex = index ;
    if(index == 1){
      getSports();
    }
    if (index == 2){
      getScience();
    }
    emit(AppBottomNavBar());
  }

  List <dynamic> business = [] ;

  void getBusiness (){
    emit(AppGetBusinessLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' :'eg',
          'category':'business',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca' ,

        }
    ).then((value) {
      //print(value.toString());
      business = value.data['articles'];
      print(business[0]['title']);
      emit(AppGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetBusinessErrorState(error.toString()));
    });
  }

  List <dynamic> sports = [] ;

  void getSports (){
    emit(AppGetSportsLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' :'eg',
          'category':'sports',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca' ,

        }
    ).then((value) {
      //print(value.toString());
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(AppGetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetSportsErrorState(error.toString()));
    });
  }

  List <dynamic> science = [] ;

  void getScience (){
    emit(AppGetScienceLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' :'eg',
          'category':'science',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca' ,

        }
    ).then((value) {
      //print(value.toString());
      science = value.data['articles'];
      print(science[0]['title']);
      emit(AppGetScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetScienceErrorState(error.toString()));
    });
  }


  List <dynamic> search = [] ;

  void getSearch (String value){
    emit(AppGetSearchLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':'$value',
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca' ,

        }
    ).then((value) {
      //print(value.toString());
      search = value.data['articles'];
      print(search[0]['title']);
      emit(AppGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AppGetSearchErrorState(error.toString()));
    });
  }


}
