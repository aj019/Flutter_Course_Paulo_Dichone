import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new BMIApp(),
      theme: new ThemeData(
        primaryColor: Colors.pink
      ),
    );
  }
  
}

class BMIApp extends StatefulWidget{
  @override
  BMIAppState createState() {
    return new BMIAppState();
  }
  
}

class BMIAppState extends State<BMIApp> {

  TextEditingController _ageController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();

  var bmi_status = '';
  var weight_status = '';
  var bmi_value;
  void calculate_bmi(){

    setState((){
      if(_ageController.text.isNotEmpty && _heightController.text.isNotEmpty && _weightController.text.isNotEmpty){

        int age = int.parse(_ageController.text);
        double height = double.parse(_heightController.text);
        int weight = int.parse(_weightController.text);
        bmi_value = (weight/height)/height;
        bmi_status = 'Your BMI : $bmi_value';

        if(bmi_value > 30){
          weight_status = 'Obese';
        }else if(bmi_value <30 && bmi_value > 18){
          weight_status = 'Normal';
        }else{
          weight_status = 'Underweight';
        }

      }else{
        bmi_status = 'Please fill all the fields first';
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI Calculator'),
      ),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            new Image.asset('images/bmilogo.png',width: 100.0,height: 100.0,),
        new Container(
          color: Colors.grey.shade300,
          padding: const EdgeInsets.all(10.0),
          child:  new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                    hintText: 'Age',
                    icon: new Icon(Icons.person),
                ),
                controller: _ageController,
                keyboardType: TextInputType.number,
              ),
              new TextField(
                decoration: new InputDecoration(
                    hintText: 'Height in Feet',
                    icon: new Icon(Icons.insert_chart)
                ),
                controller: _heightController,
                keyboardType: TextInputType.number,
              ),new TextField(
                decoration: new InputDecoration(
                    labelText: 'Weight in lb',
                    hintText: 'eg 180',
                    icon: new Icon(Icons.line_weight)
                ),
                keyboardType: TextInputType.number,
                controller: _weightController,
              ),
              new Padding(padding: const EdgeInsets.all(10.0)),
              new RaisedButton(onPressed: (){
                calculate_bmi();
              },
                disabledColor: Colors.pink,
                child:  new Text('Calculate', style: new TextStyle(color: Colors.white),),
                color: Colors.pink,)
            ],
          ),
        ),
            new Padding(padding: const EdgeInsets.all(10.0)),
            new Text('$bmi_status',style: new TextStyle(fontSize: 30.0,color: Colors.blueAccent)),
            new Padding(padding: const EdgeInsets.all(10.0)),
            new Text('$weight_status',style: new TextStyle(fontSize: 20.0,color: Theme.of(context).primaryColor))
          ],
        ),
      ),
    );
  }
}

