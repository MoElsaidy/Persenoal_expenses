import 'package:flutter/material.dart';
import 'package:personal_expenses/t.dart';
import 'package:personal_expenses/t_l.dart';
import 'package:personal_expenses/new_t.dart';

import 'bottom.dart';



void main() => runApp(
      MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
        //theme: ThemeData.dark(),
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> u_transactions = [];

  void _add(String t, double p) {
    final tx = Transaction(
        title: t,
        amount: p,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      u_transactions.add(tx);
    });
   
  }

  
  
 void _s(BuildContext ctx) {
     showModalBottomSheet(
      backgroundColor: Colors.grey,
         context: ctx,
         
         builder: (_) {
            return NewT(_add);
          }
          );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Personal expenses"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Text("هاتصرف كام الإسبوع ده ؟؟؟",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              Container(
                margin: EdgeInsets.only(top:2.0),
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage("assets/c.jpg"), fit: BoxFit.cover)),
          ),
              TransactionList(u_transactions),
            ],
          ),
        ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _s(context),
          backgroundColor: Colors.black,
        ),
 bottomNavigationBar: Bottom(),
        );
  
  }}
