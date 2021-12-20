import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'AsmaulHusna.dart';
import 'Doa.dart';
import 'Dzikir.dart';
import 'Favorite.dart';
import 'HomePage.dart';

class MyApp extends StatefulWidget {
  var currentIndex;
  MyApp(this.currentIndex);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isAlquranSearch = false;

  @override
  void initState() {
    setState(() {
      super.initState();
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    var thisPage;
    double displayWidth = MediaQuery.of(context).size.width;
    if (widget.currentIndex == 0) {
      setState(() {
        thisPage = Center(
          child: HomePage(),
        );
      });
    } else if (widget.currentIndex == 1) {
      setState(() {
        thisPage = Center(
          child: HalamanDoa(),
        );
      });
    } else if (widget.currentIndex == 2) {
      setState(() {
        thisPage = Center(
          child: AsmaulHusna(),
        );
      });
    } else if (widget.currentIndex == 3) {
      setState(() {
        thisPage = Center(
          child: Favorite(),
        );
      });
    }

    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      isDark = false;
    } else {
      isDark = true;
    }
    // final text = MediaQuery.of(context).platformBrightness == Brightness.dark
    return FutureBuilder(builder: (context, snapshot) {
      return Scaffold(
        appBar: widget.currentIndex < 3
            ? AppBar(
                backgroundColor:
                    isDark == true ? Color.fromRGBO(40, 36, 36, 1) : null,
                centerTitle: true,
                title: !isAlquranSearch
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.currentIndex == 0
                                ? 'Al-Quran'
                                : widget.currentIndex == 1
                                    ? "Doa Pendek"
                                    : widget.currentIndex == 2
                                        ? "Asmaul Husna"
                                        : "Favorite",
                          ),
                        ],
                      )
                    : TextField(
                        onChanged: (value) {
                          setState(() {
                            widget.currentIndex = 0;
                            HapticFeedback.lightImpact();
                            alquranSearch = value.toString();
                          });
                        },
                        style: TextStyle(color: Colors.white),
                        autofocus: true,
                        decoration: InputDecoration(
                            icon:
                                Icon(Icons.search_rounded, color: Colors.white),
                            hintText: "search surat",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                actions: <Widget>[
                  isAlquranSearch
                      ? IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            setState(() {
                              this.isAlquranSearch = !this.isAlquranSearch;
                              alquranSearch = "";
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.search_rounded),
                          onPressed: () {
                            setState(() {
                              this.isAlquranSearch = !this.isAlquranSearch;
                            });
                          },
                        )
                ],
              )
            : null,
        floatingActionButton: FloatingActionButton(
          backgroundColor: isDark == true ? (Colors.grey) : (Colors.blue),
          onPressed: () {},
          child: Column(
            children: [
              IconButton(
                  icon: Image.asset('icon/dzikir.png'),
                  iconSize: 7,
                  onPressed: () {
                    Navigator.push(context, Transition(Dzikir()));
                  }),
            ],
          ),
        ),
        backgroundColor:
            isDark == true ? Color.fromRGBO(48, 44, 44, 1) : Colors.white,
        body: thisPage,
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          decoration: BoxDecoration(
            color: isDark == false ? Colors.white : Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 4,

            scrollDirection: Axis.horizontal,
            // padding: EdgeInsets.symmetric(horizontal: displayWidth * .0),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(() {
                  widget.currentIndex = index;
                  HapticFeedback.lightImpact();
                });
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == widget.currentIndex
                        ? displayWidth * .32
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height:
                          index == widget.currentIndex ? displayWidth * .12 : 0,
                      width:
                          index == widget.currentIndex ? displayWidth * .32 : 0,
                      decoration: BoxDecoration(
                        color: index == widget.currentIndex
                            ? isDark == false
                                ? Colors.blueAccent.withOpacity(.2)
                                : Colors.white.withOpacity(.6)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == widget.currentIndex
                        ? displayWidth * .31
                        : displayWidth * .18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == widget.currentIndex
                                  ? displayWidth * .13
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == widget.currentIndex ? 1 : 0,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == widget.currentIndex
                                    ? '${listOfStrings[index]}'
                                    : '',
                                style: TextStyle(
                                  color: isDark == false
                                      ? Colors.blueAccent
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == widget.currentIndex
                                  ? displayWidth * .03
                                  : 20,
                            ),
                            ImageIcon(
                              listOfIcons[index],
                              size: displayWidth * .076,
                              color: index == widget.currentIndex
                                  ? isDark == false
                                      ? Colors.blueAccent
                                      : Colors.black
                                  : isDark == true
                                      ? Colors.black
                                      : Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  List<AssetImage> listOfIcons = [
    AssetImage("icon/Alquran.png"),
    AssetImage("icon/doa.png"),
    AssetImage("icon/asmaul_husna.png"),
    AssetImage("icon/favorite.png"),
  ];

  List<String> listOfStrings = [
    'Al-Quran',
    'Doa',
    'Asmaul',
    'Favorite',
  ];
}
