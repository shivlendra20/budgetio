import 'package:flutter/material.dart';


class AddingPage extends StatefulWidget {

  @override
  _AddingPageState createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> implements ResultDialog {
  int selectedIcon = -1;
  late BuildContext dialogContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'Add Spending',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),
                SizedBox(height: 40.0),
                ElevatedButton(onPressed: () {
                  _showPopupMenu(context, this);
                },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100,100),
                  ),
                  child:(selectedIcon == -1) ?
                    Column(
                    children: <Widget>[
                      Icon(Icons.add,size: 60.0,),
                      Text("Add Icon")
                    ],
                  ) : Image.asset('assets/images/' + ((selectedIcon == 0 ) ? 'icon.jpg': 'burger.png') , height: 100,fit: BoxFit.fill,),

                ),
                SizedBox(height: 50.0,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',

                  ),
                ),

                SizedBox(height: 10.0,),
                TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date',

                    ),
                    keyboardType: TextInputType.datetime),

                SizedBox(height: 10.0,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(height: 15.0,),
                ElevatedButton(onPressed: (){}, child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(80.0, 70.0),
                  ),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }

  @override
  void selectedOption(int position) {
    selectedIcon = position;
    Navigator.pop(dialogContext);
    setState(() {});
  }
  void _showPopupMenu(BuildContext context, ResultDialog callback )  {
    var errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 300.0,
        width: 300.0,

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    callback.selectedOption(0);
                  },
                  child: Card(child: Row(
                    children: [
                      Image.asset('assets/images/icon.jpg', height: 100,fit: BoxFit.fill,),
                      SizedBox(width: 20,),
                      Text("Netflix")
                    ],
                  ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    callback.selectedOption(1);
                  },
                  child: Card(child: Row(
                    children: [
                      Image.asset('assets/images/burger.png', height: 100,fit: BoxFit.fill,),
                      SizedBox(width: 20,),
                      Text("Burger")
                    ],
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) {
      dialogContext = context;
      return errorDialog;
    });


  }
}


abstract class ResultDialog{
  void selectedOption(int position);
}

