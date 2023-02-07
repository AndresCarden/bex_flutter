import 'dart:convert';


import 'package:bex_flutter/models/json_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomePageJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DATA JSON'),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: _listData());
  }

  Widget _listData() {
    return FutureBuilder(

        future: LeerJson(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (snapshot.hasData) {
            var dataJson = snapshot.data as List<ModelJson>;
            return ListView.builder(
              itemCount: dataJson.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 20,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        dataJson[index].email.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        ),
                                      )),

                                  Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        dataJson[index].postId.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple
                                        ),
                                      )),

                                ],
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    dataJson[index].name.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                    ),
                                  )),
                              const SizedBox(height: 10,),
                              Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    dataJson[index].body.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      color: Colors.amber
                                    ),
                                  )),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(left: 8, right: 8),
                                      child: Text(
                                        dataJson[index].id.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          color: Colors.red
                                        ),
                                      )),
                                ],
                              )

                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }

        });
  }

  //consumiendo el formato json y pasando al modelo
  Future<List<ModelJson>> LeerJson() async {
    final data = await rootBundle.loadString("json/Data.json");
    final list = json.decode(data) as List<dynamic>;

    return list.map((e) => ModelJson.fromJson(e)).toList();
  }
}
