import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:untitled2/fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/states.dart';
import 'package:untitled2/catagory.dart';
void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

final key = new GlobalKey<_HomeState>();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  var data;
  String name = "Delhi";
  var dj = fetchdata(" ");
  String state = "Delhi";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // main heading container
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, top: 50),
                      child: Text(
                        "Covid App India",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SvgPicture.asset('assets/doc.svg')),
                ],
              ),
            ),
            // drop down box
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 40 ,
              child: Text("Search your state ",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xFFE5E5E5),
                  )),
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit_location),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon: SvgPicture.asset('assets/dropdown.svg'),
                      value: name,
                      menuMaxHeight: 400,
                      items: [
                        'Maharashtra',
                        'Kerala',
                        'Karnataka',
                        'Tamil Nadu',
                        'Andhra Pradesh',
                        'Uttar Pradesh',
                        'West Bengal',
                        'Delhi',
                        'Chhattisgarh',
                        'Rajasthan',
                        'Odisha',
                        'Gujarat',
                        'Madhya Pradesh',
                        'Haryana',
                        'Bihar',
                        'Telangana',
                        'Punjab',
                        'Assam',
                        'Jharkhand',
                        'Uttarakhand',
                        'Jammu and Kashmir',
                        'Himachal Pradesh',
                        'Goa',
                        'Puducherry',
                        'Manipur',
                        'Tripura',
                        'Chandigarh',
                        'Meghalaya',
                        'Arunachal Pradesh',
                        'Nagaland',
                        'Mizoram',
                        'Sikkim',
                        'Ladakh',
                        'Dadra and Nagar Haveli and Daman and Diu',
                        'Lakshadweep',
                        'Andaman and Nicobar Islands'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) async {
                        setState(() {
                          name = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left:30 , right :30),
              margin: EdgeInsets.only(right:20),
              height: 50,
              alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Case update",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          {
                            url =
                                'http://10.0.2.2:5000/api?query=' + name.toString();
                            data = await fetchdata(url);
                            var decoded = jsonDecode(data);
                            print(decoded);
                            print(name);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page(name : name ,active :decoded["ACTIVE"] , death : decoded["DEATHS"] , recovered : decoded["RECOVERED"])),
                            );
                          }
                        },
                        child: Text("Search", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),)
                    ),
                  ],
                )
            ),

          Container(
            padding: EdgeInsets.all(20),
            height: 450,
            child: Image.asset(
                                'assets/map.jpg',
                                fit: BoxFit.fill,
                              ),
          ),
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 50),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  CategoryTitle(title: "Active",value: "3,35,476",col:Colors.orange),
                  CategoryTitle(title: "Death",value: "4,43,960",col:Colors.red),
                  CategoryTitle(title: "Recovered",value: "3,25,52,990",col:Colors.green),

                ],
              ),
            ),

          //   Container(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: <Widget>[
          //         Row(
          //           children: <Widget>[
          //             Expanded(
          //               flex: 1,
          //               child: Container(
          //                 height: 350,
          //                 alignment: Alignment.center,
          //                 child: Image.asset(
          //                   'assets/map.jpg',
          //                   fit: BoxFit.fill,
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               flex: 1,
          //               child: Column(
          //                 children: <Widget>[
          //                   Container(
          //                       height: 100,
          //                       width: 200,
          //                       padding: EdgeInsets.only(top: 20),
          //                       margin: EdgeInsets.symmetric(
          //                           horizontal: 10, vertical: 10),
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: <Widget>[
          //                           Text(
          //                             "100000",
          //                             style: TextStyle(
          //                               fontSize: 40,
          //                               color: Colors.orange,
          //                             ),
          //                           ),
          //                           Text(
          //                             "Active",
          //                             style: TextStyle(
          //                               fontSize: 20,
          //                               color: Colors.orange,
          //                             ),
          //                           )
          //                         ],
          //                       )),
          //                   Container(
          //                       height: 100,
          //                       width: 200,
          //                       padding: EdgeInsets.only(top: 20),
          //                       margin: EdgeInsets.symmetric(
          //                           horizontal: 20, vertical: 10),
          //                              decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: <Widget>[
          //                           Text(
          //                             "1000",
          //                             style: TextStyle(
          //                               fontSize: 40,
          //                               color: Colors.red,
          //                             ),
          //                           ),
          //                           Text(
          //                             "Death",
          //                             style: TextStyle(
          //                               fontSize: 20,
          //                               color: Colors.red,
          //                             ),
          //                           )
          //                         ],
          //                       )),
          //                   Container(
          //                       height: 100,
          //                       width: 200,
          //                       padding: EdgeInsets.only(top: 20),
          //                       margin: EdgeInsets.symmetric(
          //                           horizontal: 10, vertical: 10),
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.center,
          //                         children: <Widget>[
          //                           Text(
          //                             "200000",
          //                             style: TextStyle(
          //                               fontSize: 40,
          //                               color: Colors.green,
          //                             ),
          //                           ),
          //                           Text(
          //                             " Recoverd",
          //                             style: TextStyle(
          //                               fontSize: 20,
          //                               color: Colors.green,
          //                             ),
          //                           )
          //                         ],
          //                       ))
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   )
          ],
        ),
      ),
    );
  }
}
