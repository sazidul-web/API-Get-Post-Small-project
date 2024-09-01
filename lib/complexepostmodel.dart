import 'dart:convert';

import 'package:flutter/material.dart';
import 'Json/complexjson_postmodel.dart';
import 'package:http/http.dart' as http;

class complexepostmodel extends StatelessWidget {
  List<postModel> usermodel = [];
  Future<List<postModel>> getUsermodel() async {
    final responce =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        usermodel.add(postModel.fromJson(i));
      }
      return usermodel;
    } else {
      return usermodel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text('API Complex code'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUsermodel(),
                  builder: (context, AsyncSnapshot<List<postModel>> snapshort) {
                    if (!snapshort.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        itemCount: usermodel.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Rowareable(
                                      name: 'Name: ',
                                      value: snapshort.data![index].name
                                          .toString()),
                                  Rowareable(
                                      name: 'UserName: ',
                                      value: snapshort.data![index].username
                                          .toString()),
                                  Rowareable(
                                      name: 'Gmail: ',
                                      value: snapshort.data![index].email
                                          .toString()),
                                  Rowareable(
                                      name: 'Address Street: ',
                                      value: snapshort
                                          .data![index].address!.street
                                          .toString()),
                                  Rowareable(
                                      name: 'Address geo lat: ',
                                      value: snapshort
                                          .data![index].address!.geo!.lat
                                          .toString()),
                                  Rowareable(
                                      name: 'Phone: ',
                                      value: snapshort.data![index].phone
                                          .toString()),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }))
        ],
      ),
    );
  }
}

class Rowareable extends StatelessWidget {
  String name, value;
  Rowareable({required this.name, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(name),
          Text(value),
        ],
      ),
    );
  }
}
