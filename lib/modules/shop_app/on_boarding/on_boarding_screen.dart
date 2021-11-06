import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context,index) => buildBoardItem(),
                itemCount: 3,
              ),
            ),
            Row(
              children: [
                Text('Indicator'),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){},
                  child: Icon (Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardItem() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('assets/images/boarding_1.png'),
        ),
      ),
      SizedBox(height: 20,),
      Text('Screen Title'),
      SizedBox(height: 20,),
      Text('Screen Body'),
    ],
  );
}
