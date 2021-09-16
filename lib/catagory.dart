import 'package:flutter/material.dart';
class CategoryTitle extends StatelessWidget {
  final String title;
  final bool active;
  final String value;
  final Color col;

  const CategoryTitle({
    this.active = false,
    required this.title,
    required this.value,
    required this.col,
  }) : super();

  @override
  Widget build(BuildContext context) {
    var cc=col;
    return  Container(
                              height: 100,
                              width: 200,
                              padding: EdgeInsets.all( 10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border : Border.all(width: 5,color: Colors.grey),
                                color: Colors.grey[200],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: col,
                                    ),
                                  ),
                                  Text(
                                    title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: col,
                                    ),
                                  )
                                ],
                              )
    );
  }
}