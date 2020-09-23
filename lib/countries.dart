import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './country.dart';

var value;

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {

  List countries,filtered;
  bool isLoading,isSearching=false;


  @override
  void initState(){
    isLoading=false;
    this.global1Cases();
    super.initState();
  }

  
  Future<String> global1Cases() async{
    final String url='https://api.covid19api.com/summary';
    var data=await http.get(Uri.encodeFull(url));
    if(mounted){this.setState((){
      var jsonData1=json.decode(data.body);
      countries = [jsonData1['Countries']];
      countries=countries[0];
      filtered=countries;
    });}
    setState(() {
      isLoading=true;
    });
    return "success";
  }


  void _filter(value){
    setState(() {
      filtered=countries.where((country) => country['Country'].toLowerCase().contains(value.toLowerCase()),).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
          title: !isSearching?Center(child: Text('Country-wise',style: TextStyle(fontFamily: 'Barrio',fontSize: 25))): TextField(autofocus: true,onChanged:(value){
            _filter(value);
          } ,
            decoration:InputDecoration(icon:Icon(CupertinoIcons.search),hintText: "Search Country")
          ),
          gradient: LinearGradient(colors: [Colors.red[600], Colors.red[400]]),
          actions: <Widget>[
            isSearching?IconButton(icon: Icon(Icons.cancel),
             onPressed: (){
               setState(() {
               this.isSearching=false;
               filtered=countries;
               });
             }):IconButton(icon: Icon(Icons.search),
              onPressed: (){
                setState(() {
                  this.isSearching=true;
                });
              })
          ],
        ),
      backgroundColor: Colors.red,
      body:isLoading==false?SpinKitRipple(
        color: Colors.blue,
        size: 500,
      ) :
      ListView.builder(
        itemCount:filtered.length,
        itemBuilder:(BuildContext context,int index){
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            child: ListTile(
              leading: Image.asset('assets/images/country.png'),
              title: Text('${filtered[index]['Country'].toString()}'),
              subtitle: Text('Total Confirmed: ${filtered[index]['TotalConfirmed'].toString()}'),
              onTap: () {
                value=filtered[index];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Country(value),
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