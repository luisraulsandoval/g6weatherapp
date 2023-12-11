import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g6weatherapp/models/weather_model.dart';
import 'package:g6weatherapp/pages/services/api_services.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? ciudad;
  bool isLoading = true;
  getDataLocation() async {
    ApiServices apiServices = ApiServices();
    ciudad = await apiServices.getWeatherData();
    if (ciudad != null) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLocation();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff2A2D32),
        appBar: AppBar(
          title: const Text("Weather App"),
          centerTitle: true,
          backgroundColor: const Color(0xff2A2D32),
          elevation: 0,
        ),
        body: isLoading == true && ciudad == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/nube.png",
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ciudad!.current.tempC.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeigth * 0.15,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            " °C",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    "${ciudad!.location.name}, UK",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // getWeatherData();
                    },
                    child: Text("DEBUG"),
                  )
                ],
              ),
      ),
    );
  }
}
