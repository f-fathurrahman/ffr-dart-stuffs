import 'package:flutter/material.dart';

class TestTimePicker extends StatefulWidget {
  @override
  _TestTimePickerState createState() => _TestTimePickerState();
}

class _TestTimePickerState extends State<TestTimePicker> {
  
  TimeOfDay selectedTime = TimeOfDay.now();

  void _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
      selectedTime = picked;
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
          Text("${selectedTime.hour}:${selectedTime.minute}",
            style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            onPressed: () => _selectTime(context),
            child: Text('Select time', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            color: Colors.greenAccent,
          ),
        ],
      )
    )
  );
  }
}