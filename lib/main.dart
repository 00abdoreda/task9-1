import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController myname = new TextEditingController();
  String ?s ;



  SaveData(String a) async{
    var pref = await SharedPreferences.getInstance();
    pref.setString("key1", "$a");



  }
 GetData() async{

   var pref = await SharedPreferences.getInstance();
  var s= pref.getString("key1")??"no";
  return s;



  }
  DeleteData() async{
    var pref = await SharedPreferences.getInstance();
    pref.remove("key1");

  }


  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child:Column(
          children: [
             Container(
              child: TextFormField(
                controller: myname,

                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your name'
                ),
              ),


            ),
            SizedBox(height: 10,),
            Container(
              child: FlatButton(
                child: Text('Save Data', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  SaveData(myname.text);
                  setState(() {

                  });


                },
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: FlatButton(
                child: Text('Read data', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () async {

                  s= await GetData()  ;
                  setState(() {});




                  }

                  ),





              ),
            SizedBox(height: 10,),
            Container(
              child: FlatButton(
                  child: Text('Delete data', style: TextStyle(fontSize: 20.0),),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () async {
                    await DeleteData();
                    s = "no name";
                    setState(() {});
                  }),





            ),

            SizedBox(height: 10,),
            Container(
                child: Text(

                  "Hello ${s??"noname"}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
            ),
          ],
        ),



        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.


      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
