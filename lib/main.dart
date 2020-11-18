import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> values=["Blue","Cloud","Leaves","Water"];
  List<String> images=["assets/images/blue.jpeg","assets/images/cloud.jpg","assets/images/leaves.jpeg","assets/images/water.jpeg"];
  String selectedValue="";
  bool isValue=true;
  bool isCheck=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Sheet",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                color: Colors.green,
                child: Text("Show Bottom Sheet",style: TextStyle(color: Colors.white),),
                onPressed: (){
                  callBottom();
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: isValue?Container():Text(selectedValue),
            )
          ],
        ),
      ),
    );
  }


  void callBottom(){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(  // this is new
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                    //height: 350,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              top: 20.0,
                              bottom: 15.0),
                          child: Text(
                            'Meritos',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: 'Jost',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            height: 80,
                            padding:
                            EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Column(
                              children: <Widget>[
                                CheckboxListTile(
                                  title: Text('checkbox'),
                                  onChanged: (bool value) {
                                    setState(() {
                                      isCheck = value;
                                    });
                                  },
                                  value: isCheck,
                                )
                              ],
                            )),
                      ],
                    ));
              });
        });
  }


  String selectedItem(String value){
    selectedValue="";
    selectedValue=value;
    setState(() {
      isValue=false;
    });
    Navigator.pop(context);
  }

}

/*
showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(  // this is new
                        builder: (BuildContext context, StateSetter setState) {
                      return Container(
                          height: 350,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 20.0,
                                    bottom: 15.0),
                                child: Text(
                                  'Meritos',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontFamily: 'Jost',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  height: 80,
                                  padding:
                                      EdgeInsets.only(left: 25.0, right: 25.0),
                                  child: Column(
                                    children: <Widget>[
                                      CheckboxListTile(
                                        title: Text('checkbox'),
                                        onChanged: (bool value) {
                                          setState(() {
                                            _checked = value;
                                          });
                                        },
                                        value: _checked,
                                      )
                                    ],
                                  )),
                            ],
                          ));
                    });
                  });
 */

/*
showModalBottomSheet(context: context,builder: (context){
      return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
        ),
        child: ListView.builder(itemCount: values.length,primary:false,itemBuilder: (context,index){
          return ListTile(
            leading: CircleAvatar(radius: 30,backgroundImage: AssetImage(images[index]),backgroundColor: Colors.transparent,),
            title: Text(values[index]),
            trailing: CheckboxListTile(
              value: isCheck,
              onChanged: (bool value){
                setState(() {
                  isCheck=value;
                });
              },
            ),
          );
        },)
      );
    });
 */