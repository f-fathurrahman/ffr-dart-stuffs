import 'package:flutter/material.dart';

class TestDatePicker extends StatefulWidget {
  @override
  _TestDatePickerState createState() => _TestDatePickerState();
}

class _TestDatePickerState extends State<TestDatePicker> {
  
  /// Defaults to today's date.
  DateTime selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1  
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
      selectedDate = picked;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Datetime Picker'),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text("${selectedDate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            onPressed: () => _selectDate(context), // Refer step 3
            child: Text('Select date', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            color: Colors.greenAccent,
          ),
        ],
      )
    )
  );
  }
}