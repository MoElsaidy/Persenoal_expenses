import 'package:flutter/material.dart';

class NewT extends StatefulWidget {
  final Function addtx;

  NewT(this.addtx);

  @override
  _NewTState createState() => _NewTState();
}

class _NewTState extends State<NewT> {
  final title_controller = TextEditingController();
  final price_controller = TextEditingController();

  void start() {
    final add_title = title_controller.text;
    final add_price = double.parse(price_controller.text);
    if (add_title.isEmpty || add_price <= 0) {
      return;
    }

    widget.addtx(add_title, add_price);
    Navigator.of(context).pop();
  }

 

  void _change4() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2022));
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: "Title"),
              controller: title_controller,
              onSubmitted: (_) => start,
            ),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(labelText: "price"),
              controller: price_controller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => start,
            ),
            new Row(
              children: <Widget>[
                new FlatButton.icon(
                  onPressed: _change4,
                  icon: Icon(Icons.calendar_today),
                  label: Text("Select Date"),
                  textColor: Colors.deepPurple,
                )
              ],
            ),
            FlatButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: start,
              icon: Icon(Icons.add),
              label: Text("Add Transaction"),
              textColor: Colors.white,
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}
