import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //Map data = {};
  dynamic data;

  @override
  Widget build(BuildContext context) {

    //Get arguments for routing
    //data = ModalRoute.of(context).settings.arguments;
    data = ModalRoute.of(context)?.settings.arguments;
    //Set background images from the ternary operator in world_time.dart class.
    String bgImages = data['isDayTime'] ? 'day_image.jpg' : 'night_image.jpg';
    Color bgColors = (data['isDayTime'] ? Colors.blue : Colors.indigo);

    return Scaffold(
    backgroundColor: bgColors,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImages'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: const Icon(
                          Icons.edit_location,
                        color: Colors.grey,
                      ),
                      label: const Text(
                          'Edit Location',
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          data['location'],
                        style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 66.0,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
