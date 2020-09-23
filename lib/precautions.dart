import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flip_card/flip_card.dart';

class Precautions extends StatefulWidget {
  @override
  _PrecautionsState createState() => _PrecautionsState();
}

class _PrecautionsState extends State<Precautions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
          title: Center(child: AutoSizeText('Precautions',style: TextStyle(fontFamily: 'Barrio',fontSize: 25),maxLines: 1,)),
          gradient: LinearGradient(colors: [Colors.red[600], Colors.red[400]]),
        ),
      backgroundColor: Colors.red,
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            FlipCard(
  direction: FlipDirection.HORIZONTAL, // default
  front: Container(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Image.asset('assets/images/sd.gif')),
    ),
    back: Container(
        child: Card(elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4,4,4,4),
        child: Text('Maintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.',
        style: TextStyle(color: Colors.pink,fontSize: 30,fontFamily: 'Neucha'),),
      )),
      
    ),
),
FlipCard(
  direction: FlipDirection.HORIZONTAL, // default
  front: Container(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Image.asset('assets/images/notouching.gif')),
    ),
    back: Container(
        child: Card(elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4,4,4,4),
        child: Text('Do not touch your eyes,nose and mouth directy. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick.',
        style: TextStyle(color: Colors.pink,fontSize: 30,fontFamily: 'Neucha'),),
      )),
      
    ),
),
FlipCard(
  direction: FlipDirection.HORIZONTAL, // default
  front: Container(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Image.asset('assets/images/wash.gif')),
    ),
    back: Container(
        child: Card(elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4,4,4,4),
        child: Text('Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.If soap and water are not readily available, use a hand sanitizer that contains at least 60% alcohol.',
        style: TextStyle(color: Colors.pink,fontSize: 30,fontFamily: 'Neucha'),),
      )),
      
    ),
),
FlipCard(
  direction: FlipDirection.HORIZONTAL, // default
  front: Container(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Image.asset('assets/images/gif.gif')),
    ),
    back: Container(
        child: Card(elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4,4,4,4),
        child: Text('Staying at home is the best thing we can all do to stop the spread of COVID-19 and save lives.',
        style: TextStyle(color: Colors.pink,fontSize: 30,fontFamily: 'Neucha'),),
      )),
      
    ),
),
FlipCard(
  direction: FlipDirection.HORIZONTAL, // default
  front: Container(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Image.asset('assets/images/call.gif')),
    ),
    back: Container(
        child: Card(elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.red[200],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4,4,4,4),
        child: Text('If you have fever, cough and difficulty breathing, seek medical care early.',
        style: TextStyle(color: Colors.pink,fontSize: 30,fontFamily: 'Neucha'),),
      )),
      
    ),
)
          ]
        ),))
    );
  }
}