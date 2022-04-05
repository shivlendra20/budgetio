import 'dart:convert';

import 'package:budgetio/FactsModel.dart';
import 'package:budgetio/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Budgetio());

class Budgetio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),

      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();

}

class _InputPageState extends State<InputPage>{

  late Future<FactsModel> placeholder;
  @override
  void initState() {
    super.initState();
    placeholder = getPlaceholder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Get Started on',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.0,
              ),

            ),
          ),
          SizedBox(height: 20),
          Text('Budgetio',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),),

          SizedBox(height: 40.0),

          FutureBuilder<FactsModel>(builder:(context, snapshot){
            if (snapshot.hasData) {
              return Center(child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text((snapshot.data!.fact.length > 60 ) ? snapshot.data!.fact : (snapshot.data!.fact.substring(0,60) +"..."), textAlign: TextAlign.center, ),
              ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },future: placeholder,),
          SizedBox(height: 40.0),
          ElevatedButton(
            child: Text('Get Started'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()),);
            },

          )

        ],
      ),
    );
    


  }

  Future<FactsModel> getPlaceholder() async {
    final response = await http
        .get(Uri.parse('https://catfact.ninja/fact'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return FactsModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load facts');
    }

}
}