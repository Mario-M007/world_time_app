import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String? location; //location name for the UI
  String? time; //the time in that location
  String? flag; //url to an asset flag icon
  String? url; //location url for api endpoint
  bool? isDayTime; //check if its daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try{
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(data);
      // print(data["datetime"]);
      // print(data["utc_offset"]);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      // time = now.toString(); //set time property
      time = DateFormat.jm().format(now);


    }
    catch(e){
      print("caught error: $e");
      time = "could not get time data";
    }



  }


}

