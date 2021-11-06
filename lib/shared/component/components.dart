import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem (article , context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(width: 20,),

        Expanded(

          child: Container(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Text(

                  '${article['title']}',

                  maxLines: 3,

                  overflow: TextOverflow.ellipsis,

                  style: Theme.of(context).textTheme.bodyText1,

                ),

                SizedBox(height: 15,),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                    fontSize: 14,

                    fontWeight: FontWeight.normal,

                    color: Colors.grey,



                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

Widget separator () => Container(
  height: 1,
  width: double.infinity,
  color: Colors.grey,
);

Widget articleBuilder(list,context) => BuildCondition(
  condition: list.length > 0,
  builder:  (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder:(context , index) => buildArticleItem(list[index],context),
      separatorBuilder: (context , index) => separator(),
      itemCount: 10,
    ),
  fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.deepOrange,),),
);

// Widget articleBuilder(list,context) => Conditional.single(
//     context: context,
//     conditionBuilder: (context) => list.length == 0,
//     widgetBuilder: (context) => Center(child: CircularProgressIndicator(color: Colors.deepOrange,),),
//
//     fallbackBuilder: (context) => ListView.separated(
//       physics: BouncingScrollPhysics(),
//       itemBuilder:(context , index) => buildArticleItem(list[index],context),
//       separatorBuilder: (context , index) => separator(),
//       itemCount: 20,
//     ),
// );



//ListView.separated(
//   physics: BouncingScrollPhysics(),
//   itemBuilder:(context , index) => buildArticleItem(list[index],context),
//   separatorBuilder: (context , index) => separator(),
//   itemCount: 20,
// )

void navigateTo(context,widget) => Navigator.push(
    context,
  MaterialPageRoute(builder: (context) => widget)
);