// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'model.dart';
import 'second.dart';

void main() => runApp(MyApp());


  class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<todos> todosList = List<todos>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Hemanth'),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: List.generate(
            
            todosList.length,
            (index) => ListTile(
             tileColor: todosList.elementAt(index).status? Colors.green : Colors.red,
             trailing: IconButton(onPressed:(){ Navigator.push(context,MaterialPageRoute(builder: (context) => second(todo: todosList[index])));},icon:const Icon(Icons.visibility),
          ),
    title:Text("${todosList.elementAt(index).userId}-${todosList.elementAt(index).id}-${todosList.elementAt(index).title}-${todosList.elementAt(index).status}"),
            
          ),
        ),
        
        
      ),
      ),
      // child: Divider(
      //   color: Colors.black,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          todosList = await Hemanth().gettodo();
          setState(() {});},
          tooltip:
          'Increment',
          child:const Icon(Icons.add),
        
      ),
    );
  }
}
