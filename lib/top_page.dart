import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udmy_wetherapp/weather.dart';
import 'package:intl/intl.dart';
import 'package:udmy_wetherapp/zip_code.dart';


class TopPage extends StatefulWidget {
  const TopPage({ Key? key }) : super(key: key);

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {

    Weather currentWeather = Weather(temp: 15,description : '晴れ', tempMax: 18, tempMin: 14);
    String? address = 'ー';
    String?  errorMessage;
    List<Weather> hourlyWeather = [
    Weather(temp: 20,description : '晴れ', time:  DateTime(2021, 10 , 1, 10), rainyPercent: 0),
    Weather(temp: 17,description : '雨',   time:  DateTime(2021, 10 , 1, 11),rainyPercent: 90 ),
    Weather(temp: 18,description : '晴れ', time:  DateTime(2021, 10 , 1, 12), rainyPercent: 45 ),
    Weather(temp: 19,description : '曇り', time:  DateTime(2021, 10 , 1, 13 ), rainyPercent: 0),
      Weather(temp: 20,description : '晴れ', time:  DateTime(2021, 10 , 1, 10), rainyPercent: 0),
      Weather(temp: 17,description : '雨',   time:  DateTime(2021, 10 , 1, 11),rainyPercent: 90 ),
      Weather(temp: 18,description : '晴れ', time:  DateTime(2021, 10 , 1, 12), rainyPercent: 45 ),
      Weather(temp: 19,description : '曇り', time:  DateTime(2021, 10 , 1, 13 ), rainyPercent: 0),
    ];

    List<Weather> dailyWeather = [
      Weather(tempMax: 26, tempMin: 20, rainyPercent: 0, time: DateTime(2021, 10, 1 )),
      Weather(tempMax: 23, tempMin: 17, rainyPercent: 40, time: DateTime(2021, 10, 2 )),
      Weather(tempMax: 25, tempMin: 19, rainyPercent: 30, time: DateTime(2021, 10, 3 )),
      Weather(tempMax: 26, tempMin: 20, rainyPercent: 0, time: DateTime(2021, 10, 1 )),
      Weather(tempMax: 23, tempMin: 17, rainyPercent: 40, time: DateTime(2021, 10, 2 )),
      Weather(tempMax: 25, tempMin: 19, rainyPercent: 30, time: DateTime(2021, 10, 3 )),
      Weather(tempMax: 26, tempMin: 20, rainyPercent: 0, time: DateTime(2021, 10, 1 )),
      Weather(tempMax: 23, tempMin: 17, rainyPercent: 40, time: DateTime(2021, 10, 2 )),
      Weather(tempMax: 25, tempMin: 19, rainyPercent: 30, time: DateTime(2021, 10, 3 ))
    ];

    List<String> weekDay = ['月','火','水','木','金','土','日'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 200,
                child: TextField(
                  onSubmitted: (value) async{
                    // 郵便番号APIのURL

                    address = await ZipCode.searchAddressFromZipCode(value);
                    print(address);
                    setState(() {});
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '郵便番号を入力'
                  ),
                )
            ),

            SizedBox(height: 50),
            Text(address.toString() , style: TextStyle(fontSize: 25),),
            Text(currentWeather.description.toString()),
            Text('${currentWeather.temp}度',style: TextStyle(fontSize: 70),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('最高気温:${currentWeather.tempMax}'),
                ),
                Text('最低気温:${currentWeather.tempMin}'),
              ],
            ),
            SizedBox(height: 50,),
            Divider(height: 8,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: hourlyWeather.map((weather) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: Column(
                        children: [
                          Text('${DateFormat('H').format(weather.time as DateTime)}時'),
                          Text('${weather.rainyPercent}%' ,style: TextStyle(color : Colors.blue)),
                          Icon(Icons.wb_sunny_sharp),
                          Padding(
                            padding: const EdgeInsets.only(top :8.0),
                            child: Text('${weather.temp}度', style: TextStyle(fontSize: 18),),
                          ),
                        ],
                      ),
                  );
                }).toList(),
              ),
            ),

            Divider(height: 8,),

           Expanded(
             child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: dailyWeather.map((weather) {
                      return Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 50,
                                child: Text('${weekDay[weather.time!.weekday - 1]}曜日')),
                            Row(
                              children: [
                                Icon(Icons.wb_sunny_sharp),
                                Text('${dailyWeather[0].rainyPercent}%', style: TextStyle(color: Colors.blue),),
                              ],
                            ),

                            Container(
                              width: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${dailyWeather[0].tempMax}度' , style: TextStyle(fontSize: 16),),
                                  Text('${dailyWeather[0].tempMin}度' , style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.4),))
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    }).toList(),


                  ),
                ),
              ),
           )
          ],
        ),
        )
      );

      

  }
}