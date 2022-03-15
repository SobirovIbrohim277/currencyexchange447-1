import 'dart:convert';

List<NBU> NBUFromJson(String str) => List<NBU>.from(json.decode(str).map((x) => NBU.fromJson(x)));

String NBUToJson(List<NBU> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NBU {
    NBU({
        required this.title,
        required this.code,
        required this.cbPrice,
        required this.nbuBuyPrice,
        required this.nbuCellPrice,
        required this.date,
    });

    String title;
    String code;
    String cbPrice;
    String nbuBuyPrice;
    String nbuCellPrice;
    String date;

    factory NBU.fromJson(Map<String, dynamic> json) => NBU(
        title: json["title"],
        code: json["code"],
        cbPrice: json["cb_price"],
        nbuBuyPrice: json["nbu_buy_price"],
        nbuCellPrice: json["nbu_cell_price"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
        "cb_price": cbPrice,
        "nbu_buy_price": nbuBuyPrice,
        "nbu_cell_price": nbuCellPrice,
        "date": date,
    };
}