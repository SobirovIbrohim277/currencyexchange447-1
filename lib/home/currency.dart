import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:imtihon3/data/nbu_json.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  String dropdownValue = '\$ Tanlang';
  String dropdownValue2 = '\$ Tanlang';
  String dropdownValue3 = '\$ Tanlang';
  String miqdori = "";
  String miqdor2 = "";

  List result = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "Sell",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            "Exchange",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          FutureBuilder(
            future: _getData(),
            builder: (context, AsyncSnapshot<List<NBU>> snap) {
              var data = snap.data;
              return snap.hasData
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 150.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.black,
                                ),
                                iconSize: 34,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  '\$ Tanlang',
                                  'USD',
                                  'UZS',
                                  'RUB'
                                ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  dropdownValue = dropdownValue2;
                                  dropdownValue2 = dropdownValue3;
                                  dropdownValue3 = dropdownValue;
                                });
                              },
                              child: Container(
                                width: 60.0,
                                height: 60.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    50.0,
                                  ),
                                ),
                                child: Icon(
                                  Icons.change_circle,
                                  size: 50.0,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 150.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValue2,
                                icon: const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Colors.black,
                                ),
                                iconSize: 34,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue2 = newValue!;
                                  });
                                },
                                items: <String>[
                                  '\$ Tanlang',
                                  'USD',
                                  'UZS',
                                  'RUB'
                                ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 190.0,
                              height: 50.0,
                              child: TextField(
                                onChanged: (v) {
                                  miqdori = v;
                                },
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey,
                                  labelText: 'Pul Miqdori kiriting...',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                miqdor2,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                              alignment: Alignment.center,
                              width: 190.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50.0),
                        InkWell(
                          onTap: () {
                            setState(
                              () {
                                if (dropdownValue == "USD" &&
                                    dropdownValue2 == "UZS") {
                                  miqdor2 = (int.parse(miqdori) *
                                          double.parse(data![23].cbPrice))
                                      .toStringAsFixed(2)
                                      .toString();
                                } else if (dropdownValue == "RUB" &&
                                    dropdownValue2 == "UZS") {
                                  miqdor2 = (int.parse(miqdori) *
                                          double.parse(data![18].cbPrice))
                                      .toStringAsFixed(2)
                                      .toString();
                                } else if (dropdownValue == "UZS" &&
                                    dropdownValue2 == "RUB") {
                                  miqdor2 = (int.parse(miqdori) /
                                          double.parse(data![18].cbPrice))
                                      .toStringAsFixed(2)
                                      .toString();
                                } else if (dropdownValue == "UZS" &&
                                    dropdownValue2 == "USD") {
                                  miqdor2 = (int.parse(miqdori) /
                                          double.parse(data![23].cbPrice))
                                      .toStringAsFixed(2)
                                      .toString();
                                } else if (dropdownValue == "RUB" &&
                                    dropdownValue2 == "USD") {
                                  miqdor2 = (int.parse(miqdori) *
                                          double.parse(data![23].cbPrice))
                                      .toStringAsFixed(2)
                                      .toString();
                                } else if (dropdownValue == "USD" &&
                                    dropdownValue2 == "RUB") {
                                  miqdor2 = (int.parse(miqdori) /
                                          double.parse(data![18].cbPrice))
                                      .toStringAsFixed(2)
                                      .toString();
                                }

                                result.add(
                                  {
                                    "from": {
                                      "name": dropdownValue,
                                      "price": miqdori,
                                    },
                                    "to": {
                                      "name": dropdownValue2,
                                      "price": miqdor2,
                                    }
                                  },
                                );
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 200.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.red[300],
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                            ),
                            child: Text(
                              "Sell",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 300.0,
                          width: 300.0,
                          child: ListView.builder(
                            itemCount: result.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Row(
                                  children: [
                                    Text(result[index]["from"]["price"]
                                        .toString()),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Text(
                                      result[index]["from"]["name"].toString(),
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  result[index]["to"]["name"].toString(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: CupertinoActivityIndicator(),
                    );
            },
          ),
        ],
      ),
    );
  }

  Future<List<NBU>> _getData() async {
    Uri url = Uri.parse("https://nbu.uz/uz/exchange-rates/json/");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      return (json.decode(res.body) as List)
          .map((e) => NBU.fromJson(e))
          .toList();
    } else {
      throw Exception("Xato Bor : ${res.statusCode}");
    }
  }
}
