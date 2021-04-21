import 'package:flutter/material.dart';
import 'package:personal_expenses/t.dart';
import 'package:intl/intl.dart';


 class TransactionList extends StatelessWidget {
  final List<Transaction>tt;

TransactionList(this.tt);
   @override
   Widget build(BuildContext context) {
     return Column(
            children:  tt.map((tx) {
              return Card(
             
                color: Colors.black,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),),
                child: Row(
                 // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        border: Border.all(
                          
                          color: Colors.white,
                          width: 2,
                        ),
                        
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          DateFormat('yyy/MM/dd').format(tx.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    
                    Icon(Icons.delete_forever,color: Colors.white,)
                  ],
                ),
              );
            }).toList(),
          );
        
      
   }
 }