import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoustomJaosn extends StatelessWidget {
  List<Photos> Listphoto = [];
  Future<List<Photos>> listphotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    // var data = JsonDecoder(Response.body.toString());
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url']);
        Listphoto.add(photos);
      }
      return Listphoto;
    } else {
      return Listphoto;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CoustomAPI Compelete'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: listphotos(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshort) {
                  return ListView.builder(
                      itemCount: Listphoto.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshort.data![index].url.toString()),
                          ),
                          subtitle:
                              Text(snapshort.data![index].title.toString()),
                          title: Text(snapshort.data![index].title.toString()),
                        );
                      });
                }),
          ),
          // Expanded(
          //   flex: 2,
          //   child: FutureBuilder(
          //       future: listphotos(),
          //       builder: (context, snapshort) {
          //         return ListView.builder(
          //             itemCount: Listphoto.length,
          //             itemBuilder: (context, index) {
          //               return ListTile(
          //                 title: Text('Alamin zone'),
          //               );
          //             });
          //       }),
          // ),
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  Photos({required this.title, required this.url});
}
