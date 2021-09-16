import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class  page extends StatelessWidget {
  String active, death, recovered , name; //variables for constructor
  page({required this.name , required this.active, required this.death, required this.recovered});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : Text('COVID DATA') ,
          centerTitle: true,
          backgroundColor: Colors.blue[600],
        ),
        body : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height : 30 ) ,
            Container(
              alignment: Alignment.center,
              child: Text(name, style: TextStyle(
                fontSize: 40 ,
                color : Colors.blue  ,
              ),
              ),
            ),
            Container(
                height : 100 ,
                width: 200,
                margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10 ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child : Row (
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Active" ,

                      style: TextStyle(
                        fontSize: 40 ,
                        color: Colors.orange,
                      ),
                    ) ,
                    Text(active ,
                      style: TextStyle(
                        fontSize: 40 ,
                        color: Colors.orange,
                      ),
                    ),

                  ],
                )

            ),
            Container(
                height : 100 ,
                width: 200,
                margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10 ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                ),
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Death",
                      style: TextStyle(
                        fontSize: 40 ,
                        color: Colors.red,
                      ),),
                    Text(death ,
                      style: TextStyle(
                        fontSize: 40 ,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
            ),

            Container(
                height : 100 ,
                width: 200,
                margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 10 ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),


                ),
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(" Recoverd" ,
                      style: TextStyle(
                        fontSize: 40 ,
                        color: Colors.green,
                      ),
                    ),
                    Text(recovered ,
                      style: TextStyle(
                        fontSize: 40 ,
                        color: Colors.green,
                      ),
                    ),

                  ],
                )

            )
          ],
        )
    );
  }
}
