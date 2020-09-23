import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';

var tc=0,nc=0,td=0,nd=0,tr=0,nr=0,t=0;
double a=0,b=0,c=0;

class Cases extends StatefulWidget {
  @override
  _CasesState createState() => _CasesState();
}

class _CasesState extends State<Cases> {

  List global;
  @override
  void initState(){
    this.globalCases();
    super.initState();
  }
  
  Future<String> globalCases() async{
    final String url='https://api.covid19api.com/summary';
    var data=await http.get(Uri.encodeFull(url));
    this.setState((){
      var jsonData=json.decode(data.body);
      global = [jsonData];
      tc=global[0]['Global']['TotalConfirmed'];
      nc=global[0]['Global']['NewConfirmed'];
      td=global[0]['Global']['TotalDeaths'];
      nd=global[0]['Global']['NewDeaths'];
      tr=global[0]['Global']['TotalRecovered'];
      nr=global[0]['Global']['NewRecovered'];
      t=global[0]['Global']['TotalConfirmed']+global[0]['Global']['TotalDeaths']+global[0]['Global']['TotalRecovered'];
      a=tc*100/t;
      b=td*100/t;
      c=tr*100/t;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: GradientAppBar(
          title: Center(child: AutoSizeText('Global',style: TextStyle(fontFamily: 'Barrio',fontSize: 25),maxLines: 1,)),
          gradient: LinearGradient(colors: [Colors.red[600], Colors.red[400]]),
        ),
        backgroundColor: Colors.red,
        body:SafeArea(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.transparent,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 100,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipBottomMargin: 8,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    rod.y.toStringAsFixed(2).toString(),
                    TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                    color: Colors.grey[900], fontWeight: FontWeight.w500, fontSize: 7.7),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Total Confirmed';
                    case 1:
                      return 'Total Deaths';
                    case 2:
                      return 'Total Recovered';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                  x: 0,
                  barRods: [BarChartRodData(y: a , color: Colors.yellow)],
                  showingTooltipIndicators: a!=0? [0]:[1]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: b, color: Colors.blue[400])],
                  showingTooltipIndicators: b!=0? [0]:[1]),
              BarChartGroupData(
                  x: 2,
                  barRods: [BarChartRodData(y: c, color: Color.fromRGBO(0, 255, 127, 1),)],
                  showingTooltipIndicators: c!=0? [0]:[1]),
            ],
          ),
        ),
      ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: GridView.count(
  primary: false,
  padding: const EdgeInsets.all(1),
  crossAxisSpacing: 0,
  mainAxisSpacing: 0,
  crossAxisCount: 1,
  childAspectRatio: 3,
  children: <Widget>[
    Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.yellow,
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top:5),
          child: ListTile(title:AutoSizeText('Total Confirmed',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText('$tc',style: TextStyle(fontFamily:'Jose' ,fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/confirm.png'),),
        ),
      ),
    ),
    Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.yellow,
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top:5),
          child: ListTile(title:AutoSizeText('New Confirmed',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText('$nc',style: TextStyle(fontFamily:'Jose' ,fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/new1.png'),),
        ),
      ),
    ),
    Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.blue[400],
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top:5),
          child: ListTile(title:AutoSizeText('Total Deaths',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText('$td',style: TextStyle(fontFamily:'Jose' ,fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/death.png'),
        )),
      ),
    ),
    Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.blue[400],
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListTile(title:AutoSizeText('New Deaths',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText('$nd',style: TextStyle(fontFamily: 'Jose',fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/new1.png')),
        ),
      ),
    ),
    Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Color.fromRGBO(0, 255, 127, 1),
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListTile(title:AutoSizeText('Total Recovered',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1,),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText('$tr',style: TextStyle(fontFamily: 'Jose',fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/recovered.png')
          ),
        ),
      ),
    ),
    Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Color.fromRGBO(0, 255, 127, 1),
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top:5),
          child: ListTile(title:AutoSizeText('New Recovered',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5),
            child: AutoSizeText('$nr',style: TextStyle(fontFamily: 'Jose',fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/new1.png')
          ),
        ),
      ),
    ),
  ],
)
              ) 
            ],
          ),
        ),
      ),
    );
  }
}