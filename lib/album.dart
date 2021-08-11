import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;

class Album {
  int? id;
  String? name;
  String? category;
  String? oldprice;
  String? price;

  Album({
    required this.id,
    required this.name,
    required this.category,
    required this.oldprice,
    required this.price,
  });

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    oldprice = json['oldprice'];
    price = json['price'];
  }
}

class Albm extends StatefulWidget {
  const Albm({Key? key}) : super(key: key);

  @override
  _AlbmState createState() => _AlbmState();
}

class _AlbmState extends State<Albm> {
  late Future<Album> futureAlbum;

  // @override
  // void initState() {
  //   super.initState();
  //   futureAlbum = fetchAlbum();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Text('${data.error}');
          } else if (data.hasData) {
            var items = data.data as List<Album>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                items[index].name.toString(),
                              )),
                          Text(
                            items[index].name.toString(),
                          ),
                          Text(
                            items[index].category.toString(),
                          ),
                          Text(
                            items[index].oldprice.toString(),
                          ),
                          Text(
                            items[index].price.toString(),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<List<Album>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/product.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Album.fromJson(e)).toList();
  }
}
