import 'dart:convert';
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
      print(body);
      for (var animal in body) {
        data.add(Animal.fromJson(animal));
      }
      return data;
    }
    return null;
  }

  Future<dynamic> getAnimal({required id}) async {
    try {
      print(id);
      late dynamic data;
      var client = http.Client();
      var uri = Uri.parse('http://localhost:3000/api/v1/animal/animal/$id');
      var response =
          await client.get(uri, headers: {"Content-Type": "application/json"});
      // print(response.body);
      if (response.statusCode == 200) {
        // print(response.body);
        data = jsonDecode(response.body);
        // print(data);
        // return Animal.fromJson(data);
        return data;
      }
    } catch (e) {
      print(e);
      return e;
    }
  }
}
