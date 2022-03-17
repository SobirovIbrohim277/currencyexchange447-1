import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:imtihon3/ui/valmalumot.dart';

class Imtihon3 extends StatelessWidget {
  String _email = "Email";
  String _parol = "Parol";
  String _inputEmail = " ";
  String _inputParol = " ";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 67, 105),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Xalq Banki",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Valyuta Ayirboshlash",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Tizimi",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 100.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://logobank.uz:8005/media/logos_preview/Xalq_banki-01.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo[50],
                    ),
                    child: TextFormField(
                      onChanged: (v) {
                        _inputEmail = v;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: "example@gmail.com",
                        labelText: "E Mail",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 44, 44, 44),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo[50],
                    ),
                    child: TextFormField(
                      onChanged: (v) {
                        _inputParol = v;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: "Parol",
                        labelText: "Parol",
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 65, 65, 65),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(25.0),
                    alignment: Alignment.center,
                    height: 60.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xffdfe6e9),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 30.0,
                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 60.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.indigo[50],
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            if (_inputEmail == _email &&
                                _inputParol == _parol) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.SUCCES,
                                animType: AnimType.SCALE,
                                title: 'Xush kelibsiz',
                                desc: "Email va Parolni to'g'ri kiritdingiz",
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Malumot(),
                                    ),
                                  );
                                },
                              ).show();
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.SCALE,
                                title: 'Qabul Qilinmadi',
                                desc: "Email yoki Parolni to'g'ri kiriting",
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Imtihon3(),
                                    ),
                                  );
                                },
                              )..show();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
