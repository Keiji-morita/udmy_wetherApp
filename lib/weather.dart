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
  }


//void main(){
  //Weather jojo = new Weather('jojo', 30);
  //print(jojo); // Instance of 'Weather'
  //print(jojo.name); // jojo
  //print(jojo.tempMax); // 30
//}



