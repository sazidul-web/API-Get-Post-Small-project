import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Json/Json_file.dart';

class Homepage extends StatelessWidget {
  Future<List<ModelName>> getpostapi() async {
    List<ModelName> postmodel = [];
    final responce =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      for (Map x in data) {
        postmodel.add(ModelName.fromJson(Map<String, dynamic>.from(x)));
      }
      return postmodel;
    } else {
      throw Exception('Field to data load');
      // return postmodel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('API Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getpostapi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('loading...');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'UserID: ${snapshot.data![index].id.toString()}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Title:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].title.toString()),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Description:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data![index].body.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
