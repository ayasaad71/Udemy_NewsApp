import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state) {},
      builder: (context,state){
        var list = AppCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                validator: (value)
                {
                  if(value!.isEmpty){
                    return 'must not be empty';
                  }else{
                    return null;
                  }
                },
                onChanged: (value){
                  AppCubit.get(context).getSearch(value);

                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                ),

              ),
            ),
            Expanded(child: articleBuilder(list, context),),
          ],
        ),
        );
      },

    );
  }
}
