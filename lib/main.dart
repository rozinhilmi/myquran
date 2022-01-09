import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/MainPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

dynamic listSurah;
dynamic surah;
dynamic listDoa;
dynamic listAsmaulHusna;

List<String> favorite = [];
List<String> favoriteDoa = [];

bool isDark = false;
getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  favorite = prefs.getStringList("favorite_ayat")!;
  favoriteDoa = prefs.getStringList("favorite_doa")!;
}

clearData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("favorite_doa");
  prefs.remove("favorite_ayat");
}

setData(String idSurah) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (!favorite.contains(idSurah)) {
    favorite.add(idSurah);
    (prefs.setStringList('favorite_ayat', favorite));
    // printData();
  } else {
    favorite.remove(idSurah);
    (prefs.setStringList('favorite_ayat', favorite));
  }
}

printData() async {
  print("favorite doa = " + favoriteDoa.toString());
  print("favorite surah = " + favorite.toString());
  // print("isDark print data = "+isDark.toString());
}

Future<void> readJsonListSurah() async {
  final String response = await rootBundle.loadString('assets/sample.json');
  final data = await json.decode(response);
  listSurah = data;
}

Future<void> readJsonSurahItem(idSurah) async {
  final String response = await rootBundle.loadString('assets/alquran.json');
  final data = await json.decode(response);
  surah = data[idSurah];
}

Future<void> readJsonListDoa() async {
  final String response =
      await rootBundle.loadString('assets/doa-sehari-hari.json');
  final data = await json.decode(response);
  listDoa = data;
}

Future<void> readJsonAsmaulHusna() async {
  final String response =
      await rootBundle.loadString('assets/asmaul-husna.json');
  final data = await json.decode(response);
  listAsmaulHusna = data;
}

String replaceFarsiNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }

  return input;
}

String alquranSearch = "";

int dzikirCounter = 0;

double hasilZakat = 0;

const spinkit = SpinKitDoubleBounce(color: Colors.grey);

void main() async {
  runApp(Global());
}

class Global extends StatefulWidget {
  // const Global({Key? key}) : super(key: key);

  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  @override
  Widget build(BuildContext context) {
    // clearData();
    return MaterialApp(
      home: MyApp(0),
    );
  }
}

class Transition extends PageRouteBuilder {
  final Widget page;

  Transition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 1000),
          reverseTransitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.centerRight,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}

setDataDoa(String idDoa) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (!favoriteDoa.contains(idDoa)) {
    favoriteDoa.add(idDoa);
    (prefs.setStringList('favorite_doa', favoriteDoa));
    // printData();
  } else {
    favoriteDoa.remove(idDoa);
    (prefs.setStringList('favorite_doa', favoriteDoa));
  }
}
