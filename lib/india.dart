import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './states.dart';

var value;

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  List india,filtered1;
  bool isSearching1=false,isLoading1;
  @override
  void initState(){
    isLoading1=false;
    this.indiaCases();
    super.initState();
  }

  Future<String> indiaCases() async{
    final String url='https://api.rootnet.in/covid19-in/stats/latest';
    var data1=await http.get(Uri.encodeFull(url));
    this.setState((){
      var jsonData1=json.decode(data1.body);
      india = [jsonData1];
      india=[india[0]['data']['regional']];
      india=india[0];
      filtered1=india;
    });
    setState(() {
      isLoading1=true;
    });
    return "success";
  }

  void _filter1(value){

    setState(() {
      filtered1=india.where((india) => india['loc'].toLowerCase().contains(value.toLowerCase()),).toList();
    });
  }

  var value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
          title: !isSearching1?Center(child: Text('India',style: TextStyle(fontFamily: 'Barrio',fontSize: 25))): TextField(autofocus: true,onChanged:(value){
            _filter1(value);
          } ,
            decoration:InputDecoration(icon:Icon(CupertinoIcons.search),hintText: "Search Country")
          ),
          gradient: LinearGradient(colors: [Colors.red[600], Colors.red[400]]),
          actions: <Widget>[
            isSearching1?IconButton(icon: Icon(Icons.cancel),
             onPressed: (){
               setState(() {
               this.isSearching1=false;
               filtered1=india;
               });
             }):IconButton(icon: Icon(Icons.search),
              onPressed: (){
                setState(() {
                  this.isSearching1=true;
                });
              })
          ],
        ),
      backgroundColor: Colors.red,
      body:isLoading1==false?SpinKitRipple(
        color: Colors.blue,
        size: 500,
      ) :
      ListView.builder(
        itemCount: filtered1.length,
        itemBuilder:(BuildContext context,int index){
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: ListTile(
              leading: Image.asset('assets/images/country.png'),
              title: Text('${filtered1[index]['loc'].toString()}'),
              subtitle: Text('Total Confirmed: ${filtered1[index]['totalConfirmed'].toString()}'),
              onTap: () {
                value=filtered1[index];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => inStates(value),
                  ),
                );
              },
            ),
          );
        }  
      )
      
    );
  }
}