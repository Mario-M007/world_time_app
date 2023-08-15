import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {


    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    //set background img
    String bgImg = data["isDayTime"] ? "day.png" : "night.png";
    Color bgColor = data["isDayTime"] ? Color.fromARGB(255, 83, 145, 196) : Color.fromARGB(255, 12, 22, 78);


    return  Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImg"),
              fit: BoxFit.cover,
            )
            ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          "time": result['time'],
                          "location": result['location'],
                          "isDayTime": result['isDayTime'],
                          "flag": result['flag']
                        };
                      });
                    }, 
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[500],
                      ),
                    label: Text(
                      "change location",
                      style: TextStyle(
                        color: Colors.grey[500]
                      ),
                      ), 
                    ),
                ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data["location"],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data["time"],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white
                    ),
                  )
              ],
            ),
          ),
        )
        ),
    );
  }
}

