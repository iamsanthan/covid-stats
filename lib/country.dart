import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Country extends StatefulWidget {
  Country(this.value);
  var value;
  @override
  _CountryState createState() => _CountryState(value);
}

class _CountryState extends State<Country> {
  var value;
  _CountryState(this.value);
  @override
  Widget build(BuildContext context) {
    var tc=0,td=0,tr=0,t=0;
    double a=0,b=0,c=0;

    tc=value['TotalConfirmed'];
    td=value['TotalDeaths'];
    tr=value['TotalRecovered'];

    t=tc+td+tr;

    a=tc*100/t;
    b=td*100/t;
    c=tr*100/t;

    return Scaffold(
      appBar: GradientAppBar(
          title: Center(child: AutoSizeText(value['Country'],style: TextStyle(fontFamily: 'Barrio',fontSize: 25),maxLines: 1,)),
          gradient: LinearGradient(colors: [Colors.grey[900], Colors.grey[700]]),
        ),
      body: SafeArea(
        child: tc==0 && td==0 && tr==0 ?
            SingleChildScrollView(
                          child: Column(
                children: <Widget>[
                  Image.asset('assets/images/smile.png'),
                  TextLiquidFill(text: 'Corona Free',waveColor: Colors.cyanAccent,boxBackgroundColor:Colors.white,textStyle: TextStyle(fontFamily: 'Ramm',fontWeight:FontWeight.bold,fontSize:30))
                ],
              ),
            ) : Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height:20),
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
                    color: Colors.teal[900], fontWeight: FontWeight.bold, fontSize: 7.7),
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
                  barRods: [BarChartRodData(y: a , color: Colors.redAccent)],
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
                child: tc==0 && td==0 && tr==0 ? Center(child: Icon(CupertinoIcons.heart_solid,color: Colors.red,size: 300,)) : GridView.count(
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
      color: Colors.redAccent,
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListTile(title:AutoSizeText('Total Confirmed',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1,),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText(value['TotalConfirmed'].toString(),style: TextStyle(fontFamily: 'Jose',fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/confirm.png'),),
        ),
      ),
    ),
    Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.redAccent,
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListTile(title:AutoSizeText('New Confirmed',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText(value['NewConfirmed'].toString(),style: TextStyle(fontFamily: 'Jose',fontSize: 25),maxLines: 1),
          ),
          trailing:Image.asset('assets/images/new2.png'),),
        ),
      ),
    ),
    Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.blue[400],
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListTile(title:AutoSizeText('Total Deaths',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText(value['TotalDeaths'].toString(),style: TextStyle(fontFamily: 'Jose',fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/death.png'),),
        ),
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
            child: AutoSizeText(value['NewDeaths'].toString(),style: TextStyle(fontFamily: 'Jose',fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/new2.png'),),
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
          child: ListTile(title:AutoSizeText('Total Recovered',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: Text(value['TotalRecovered'].toString(),style: TextStyle(fontFamily: 'Jose',fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/recovered.png'),),
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
          child: ListTile(title:Text('New Recovered',style: TextStyle(fontFamily:'Baloo' ,fontSize: 20),maxLines: 1),
          subtitle: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AutoSizeText(value['NewRecovered'].toString(),style: TextStyle(fontFamily: 'Jose',fontSize: 25),maxLines: 1),
          ),
          trailing: Image.asset('assets/images/new2.png'),),
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