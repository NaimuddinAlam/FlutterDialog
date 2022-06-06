import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _bottomsheet()
  {
    showModalBottomSheet(context: context, builder: (context) => Container(
      height: 200.0,
      child: Text("BottomSheet"),
    ));
  }

  _customDialog()
  {
    showDialog(context: context, builder: (context) => Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,

        height: double.infinity,
        color: Colors.blueGrey,
        child: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
             /* decoration: BoxDecoration(
               shape: BoxShape.circle,
                color: Colors.red
              ),*/

            )
          ],
        ),
      ),
    ));
  }

  _simpleDialog()
  {
    showDialog(context: context,
        builder: (BuildContext context)=>
    SimpleDialog(
      title: Text("Simple Dialog"),
      children: <Widget>[
        SimpleDialogOption(onPressed: (){},
        child: Text("Show"),),
        SimpleDialogOption(onPressed: (){},
        child: Text("Hide"),)
      ],
    ));
  }

  _showMyDialog()
  {

    showDialog(

      barrierDismissible: false,
      context: context,
        builder: (BuildContext context) =>
        AlertDialog(title: Text("Title of Alert"),
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  content:  Text("Description of Alert"),
        actions: [TextButton(onPressed: (){
          Navigator.of(context).pop();

        }, child: Text("Cancel")),
        TextButton(onPressed: (){}, child: Text("Confirm"))]));


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Dialog Demo"),
      ),
      body: Center(
        child: Column(
          children: [
             ElevatedButton(
              child: Text("Dialog"),
              onPressed: ()
              { _showMyDialog();},
            ),
            ElevatedButton(onPressed: ()
                {_simpleDialog();}, child: Text("Simple Dialog")),
            ElevatedButton(onPressed: (){
              _customDialog();
            }, child: Text("CustDialog")),
            ElevatedButton(
              onPressed: ()
              {
                _bottomsheet();
              },
              child: Text("BottomSheet"),
            )
          ],
        ),
      ),

    );
  }
}



