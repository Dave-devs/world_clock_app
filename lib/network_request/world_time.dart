import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  //Parameters
  String location;
  String url;
  String flag;
  String? time;
  bool? isDayTime;

  //Constructor
  WorldTime({ required this.location, required this.flag, required this.url });

  //Method
  Future<void> getDateTime() async {
    try{
      //Make a network request to api
      Response response = await get('http://worldtimeapi.org/api/timezone/$url' as Uri);
      Map data = jsonDecode(response.body);

      //Get the properties we need
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      //Convert DateTime to object
      DateTime now = DateTime(datetime as int);
      now = now.add(Duration(hours: int.parse(offset)));

      //Set the time property
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false; //To determine weather day or night time
      time = DateFormat.jm().format(now); //Local day time format

    } catch (e) {
      print('An error occurred!: $e');
      time = 'Could not get time and date';
    }
  }
}