abstract class  AppStates {}

class AppInitState extends AppStates {}

class AppBottomNavBar extends AppStates {}

class AppGetBusinessLoadingState extends AppStates {}

class AppGetBusinessSuccessState extends AppStates {}

class AppGetBusinessErrorState extends AppStates {
  final error ;
  AppGetBusinessErrorState(this.error) ;
}

class AppGetSportsLoadingState extends AppStates {}

class AppGetSportsSuccessState extends AppStates {}

class AppGetSportsErrorState extends AppStates {
  final error ;
  AppGetSportsErrorState(this.error) ;
}

class AppGetScienceLoadingState extends AppStates {}

class AppGetScienceSuccessState extends AppStates {}

class AppGetScienceErrorState extends AppStates {
  final error ;
  AppGetScienceErrorState(this.error) ;
}

class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchSuccessState extends AppStates {}

class AppGetSearchErrorState extends AppStates {
  final error ;
  AppGetSearchErrorState(this.error) ;
}


