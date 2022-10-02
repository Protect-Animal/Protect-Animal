import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:protectanimal/models/animal.dart';

class AnimalServies {
  Future<dynamic> getAnimals() async {
    var data = [];
    var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/api/v1/animal/animals');
    var response =
        await client.get(uri, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var animal in body) {
        data.add(Animal.fromJson(animal));
      }
      return data;
    }
    return null;
  }
}

const json = {
  {
    'locations': ['Eurasia', 'Europe', ' North-America'],
    'image': [
      'https://images.unsplash.com/photo-1549471013-3364d7220b75?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjc3MzV8MHwxfHNlYXJjaHwxfHxtb29zZXxlbnwwfHx8fDE2NjQ1NTA0NTg&ixlib=rb-1.2.1&q=80&w=1080'
    ]
  }
};
