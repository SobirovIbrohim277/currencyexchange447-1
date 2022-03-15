import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon3/data/nbu_json.dart';
import 'package:imtihon3/flag/flag.dart';
import 'package:imtihon3/home/currency.dart';

class Malumot extends StatefulWidget {
  @override
  _MalumotState createState() => _MalumotState();
}

class _MalumotState extends State<Malumot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "Currency Data",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,),
      body: Stack(
        children: [
          Container(
            width: 370.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            child: FutureBuilder(
              future: _getData(),
              builder: (context, AsyncSnapshot<List<NBU>> snap) {
                var data = snap.data;
                return snap.hasData
                    ? ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/" +
                                    Flag.Country_Names[index] +
                                    ".png",
                              ),
                            ),
                            title: Text(
                              data[index].title.toString(),
                            ),
                            subtitle: Text(
                              data[index].date.toString(),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  data[index].code.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.cyan[600],
                                  ),
                                ),Text(
                              data[index].nbuBuyPrice.toString(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                                Text(
                                  data[index].cbPrice.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: CupertinoActivityIndicator(),
                      );
              },
            ),
          ),
          Positioned(
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CurrencyPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
            bottom: 20.0,
            right: 20.0,
          ),
        ],
      ),
    );
  }
}

Future<List<NBU>> _getData() async {
  Uri url = Uri.parse("https://nbu.uz/uz/exchange-rates/json/");
  var res = await http.get(url);
  if (res.statusCode == 200) {
    return (json.decode(res.body) as List).map((e) => NBU.fromJson(e)).toList();
  } else {
    throw Exception("Xato Bor : ${res.statusCode}");
  }
}
