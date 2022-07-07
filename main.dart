
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              Header(context),
              Items(context)
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
                onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu));
          },
        ),
      ),
    );
  }
}

Widget Header(BuildContext context) => Container(
  width: MediaQuery.of(context).size.width,
  height: 250,
  color: Colors.green,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
        child: Icon(Icons.person),
      ),
      SizedBox(height: 10,),
      Text("RFL Studio",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
    ],
  ),
);

Widget Items(BuildContext context) => Container(
  child: Column(
    children: [
      ListTile(
        leading: Icon(Icons.home_filled),
        title: Text("Home"),
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        },
      ),
      ListTile(
        leading: Icon(Icons.search),
        title: Text("Search"),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage()));
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text("Settings"),
        onTap: (){},
      ),
      ListTile(
        leading: Icon(Icons.info),
        title: Text("About"),
        onTap: (){},
      ),
    ],
  ),
);








