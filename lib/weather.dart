 import 'dart:convert';

import 'package:http/http.dart';

class  Weather {

   int? temp ;
   int? tempMax;
   int? tempMin;
   String? description;
   double? lon; //経度
   double? lat; //緯度
   String? icon;
   DateTime? time;
   int? rainyPercent;

  //  Weather(this.temp, this.tempMax, this.tempMin, this.description, this.lon,
  //  this.lat, this.icon, this.times, this.rainyPercent);

 Weather({
      this.temp, this.tempMax, this.tempMin, this.description, this.lon,
    this.lat, this.icon, this.time, this.rainyPercent

   });

   static Future<Weather> getCurrentWeather(String zipCode) async {
     String _zipCode;
     if(zipCode.contains('-')){
       _zipCode = zipCode;
     } else {
       _zipCode = zipCode.substring(0, 3) + '-' + zipCode.substring(5);
     }
     String? url = 'https://api.openweathermap.org/data/2.5/weather?zip=$_zipCode,JP&appid=b9320c9434f37e0ac71123fa052de396&lang=ja&units=metric';
     try {
        var result = await get(Uri.parse(url));
        Map<String, dynamic> data = jsonDecode(result.body);
        print(data);
        Weather currentWeather = Weather(
          description: data['weather'][0]['description'],
          temp: data['main']['temp'],
          tempMin: data['main']['temp_min'],
          tempMax: data['main']['temp_max'],
        );
        return currentWeather;
     } catch(e) {
       print(e);
       return null!.readAsString;
     }


   }

}






