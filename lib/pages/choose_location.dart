import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
List<WorldTime> locations =[
  WorldTime(url:'Europe/London',location: 'London',flag: 'uk.png'),
  WorldTime(url:'Europe/Berlin',location: 'Berlin',flag: 'be.png'),
  WorldTime(url:'Africa/Cairo',location: 'Cairo',flag: 'ca.png'),
  WorldTime(url:'Africa/Nairobi',location: 'Nairobi',flag: 'na.png'),
  WorldTime(url:'America/Chicago',location: 'Chicago',flag: 'usa.png'),
  WorldTime(url:'America/New_York',location: 'New_York',flag: 'usa.png'),
  WorldTime(url:'Asia/Seoul',location: 'Seoul',flag: 'se.png'),
  WorldTime(url:'Asia/Jakarta',location: 'Jakarta',flag: 'ja.png'),
];
void updateTime(index) async{
  WorldTime instance = locations[index];
  await instance.getTime();
  Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDaytime':instance.isDaytime
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent[400],
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
      title:Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,

    ),
      body:ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 1.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:AssetImage('assets/${locations[index].flag}') ,
                ),
                ),
              ),
            );
          }
      ),
    );
  }
}
