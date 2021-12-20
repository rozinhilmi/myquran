import 'package:flutter/material.dart';
import '../main.dart';

class Surat extends StatefulWidget {
  int idSurah;
  Surat(this.idSurah);

  @override
  _SuratState createState() => _SuratState();
}

class _SuratState extends State<Surat> {
  @override
  Widget build(BuildContext context) {
    // print((musaf[0]['data'].length).toString());
    // print(surah);

    // return Container();
    return FutureBuilder(
        future: readJsonSurahItem(widget.idSurah),
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return spinkit;
          } else {
            return MaterialApp(
              theme: isDark == true ? ThemeData.dark() : ThemeData.light(),
              home: Scaffold(
                  appBar: AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back)),
                        Text(listSurah[widget.idSurah]["nama"].toString()),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.transparent,
                            ))
                      ],
                    ),
                  ),
                  //

                  body: ListView(
                    children: [
                      for (int i = 0; i < surah.length; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Text(surah[i]['ar'],
                                                textAlign: TextAlign.end,
                                                style:
                                                    TextStyle(fontSize: 26))),
                                        CircleAvatar(
                                          backgroundColor: isDark == true
                                              ? Colors.black.withOpacity(.5)
                                              : Colors.blue,
                                          child: Text(
                                            (surah[i]['nomor'].toString()),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          surah[i]["tr"].toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 16),
                                        ),
                                        Text(
                                          surah[i]["id"].toString(),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    )),
                              ),
                            )
                          ],
                        )
                    ],
                  )),
            );
          }
        });
  }
}
