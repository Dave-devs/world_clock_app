import 'package:flutter/material.dart';
import 'package:world_clock_app/network_request/world_time.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {

  //List of available places to get time for (more places could be added to your liking).
  List<WorldTime> locations = [
    WorldTime(flag: 'london.png', location: 'London', url: 'Europe/London'),
    WorldTime(flag: 'amsterdam.png', location: 'Amsterdam', url: 'Europe/Amsterdam'),
    WorldTime(flag: 'berlin.png', location: 'Berlin', url: 'Europe/Berlin'),
    WorldTime(flag: 'dublin.png', location: 'Dublin', url: 'Europe/Dublin'),
    WorldTime(flag: 'madrid.png', location: 'Madrid', url: 'Europe/Madrid'),
    WorldTime(flag: 'paris.png', location: 'Paris', url: 'Europe/Paris'),
    WorldTime(flag: 'moscow.png', location: 'Moscow', url: 'Europe/Moscow'),
    WorldTime(flag: 'new_delhi.png', location: 'New_Delhi', url: 'Asia/New_Delhi'),
    WorldTime(flag: 'damascus.png', location: 'Damascus', url: 'Asia/Damascus'),
    WorldTime(flag: 'pyongyang.png', location: 'Pyongyang', url: 'Asia/Pyongyang'),
    WorldTime(flag: 'seoul.png', location: 'Seoul', url: 'Asia/Seoul'),
    WorldTime(flag: 'tokyo.png', location: 'Tokyo', url: 'Asia/Tokyo'),
    WorldTime(flag: 'brasilia.png', location: 'Brasilia', url: 'South_America/Brasilia'),
    WorldTime(flag: 'washington.png', location: 'Washington', url: 'America/Washington'),
    WorldTime(flag: 'ontario.png', location: 'Ontario', url: 'America/Ontario'),
    WorldTime(flag: 'abuja.png', location: 'Abuja', url: 'Africa/Abuja'),
    WorldTime(flag: 'cairo.png', location: 'Cairo', url: 'Africa/Cairo'),
    WorldTime(flag: 'cape_town.png', location: 'Cape_Town', url: 'Africa/Cape_Town'),
    WorldTime(flag: 'nairobi.png', location: 'Nairobi', url: 'Africa/Nairobi'),
  ];

  void upDateTime(index) async {
    WorldTime newTime = locations[index];
    await newTime.getDateTime();
    //Navigate to home screen with clicked location data
    Navigator.pop(context, {
      'location': newTime.location,
      'flag': newTime.flag,
      'time': newTime.time,
      'isDayTime': newTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey,
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                   upDateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      )
    );
  }
}
