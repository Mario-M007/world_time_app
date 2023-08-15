import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  
  void setupworldTime() async {
    WorldTime wtInstance = WorldTime(location: "Beirut", flag: "lebanon.png", url: "Asia/Beirut");
    await wtInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": wtInstance.location,
      "flag": wtInstance.flag,
      "time": wtInstance.time,
      "isDayTime": wtInstance.isDayTime
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupworldTime();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
          )
      )
    );
  }
}