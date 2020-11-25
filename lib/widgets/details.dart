import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  dynamic weatherData;

  Details(this.weatherData);

  @override
  Widget build(BuildContext context) {
    int tempMax = weatherData['main']['temp_max'].toInt();
    int tempMin = weatherData['main']['temp_min'].toInt();
    int humidity = weatherData['main']['humidity'].toInt();
    double pressure = weatherData['main']['pressure'].toInt() / 1000;
    double visibilityDouble = weatherData['visibility'].toInt() / 1000;
    int visibility = visibilityDouble.toInt();

    return Container(
      decoration: BoxDecoration(
          color: Color(0x80FFFFFF),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Current details', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textDetails('Temp Max'),
                      SizedBox(height: 8.0,),
                      textDetails('Temp Min'),
                      SizedBox(height: 8.0,),
                      textDetails('Humidity'),
                      SizedBox(height: 8.0,),
                      textDetails('Pressure'),
                      SizedBox(height: 8.0,),
                      textDetails('Visibility'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textDetails(tempMax.toString() + "°C"),
                      SizedBox(height: 8.0,),
                      textDetails(tempMin.toString() + "°C"),
                      SizedBox(height: 8.0,),
                      textDetails(humidity.toString() + '%'),
                      SizedBox(height: 8.0,),
                      textDetails(pressure.toString() + ' mBar'),
                      SizedBox(height: 8.0,),
                      textDetails(visibility.toString() + ' km'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textDetails(String text){
    return Text(text, style: TextStyle(fontSize: 16.0),);
  }
}
