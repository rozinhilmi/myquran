import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'DoaItem.dart';
import 'Surat.dart';

class Favorite extends StatefulWidget {
  // const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJsonListDoa(),
        builder: (context,data){

          if(data.connectionState == ConnectionState.waiting){
            return spinkit;
          }
          else{
            return MyFavoriteList();
          }
        }

    );

  }
}



class MyFavoriteList extends StatefulWidget {
  // const MyFavoriteList({Key? key}) : super(key: key);

  @override
  _MyFavoriteListState createState() => _MyFavoriteListState();
}

class _MyFavoriteListState extends State<MyFavoriteList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: isDark == true ? Color.fromRGBO(40,36,36, 1) : null,
          // centerTitle: true,
          title: Text("Favorite"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Surah",style: TextStyle(fontSize: 25),),
              ),
              Tab(
                child: Text("Doa",style: TextStyle(fontSize: 25),),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        for(int i=0;i<(listSurah.length);i++)
                          (favorite.contains(listSurah[i]['nomor'].toString())) ?
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey,width: 0.3)
                            ),
                            // color: Colors.pink,
                            child: ListTile(

                              onTap: (){

                                Navigator.push(context, Transition(Surat(int.parse((listSurah[i]["nomor"]))-1)));
                              },
                              title: Text(listSurah[i]['nama'].toString(),style: TextStyle(color: isDark == true? Colors.white : Colors.black),),
                              subtitle: Text(listSurah[i]['asma'].toString(),style: TextStyle(color: isDark == true? Colors.white : Colors.black)),
                              leading: CircleAvatar(
                                backgroundColor: isDark == true ? Colors.black.withOpacity(.5) : Colors.blue,
                                child: Text((listSurah[i]['nomor'].toString()),style: TextStyle(color: Colors.white)),
                              ),
                              trailing: IconButton(
                                onPressed: (){
                                  setState(() {
                                    setData(listSurah[i]['nomor'].toString());
                                  });


                                },
                                icon: !favorite.contains(listSurah[i]['nomor'].toString()) ?
                                Icon(Icons.favorite_border_rounded,size: 30)
                                    : Icon(Icons.favorite,size: 30,color: Colors.redAccent,),


                              ),
                              // trailing: Text(listSurah[i]['ayat'].toString()+ " ayat",style: TextStyle(color: isDark == true? Colors.white : Colors.black))
                            ),
                          ) : Container()

                        // Text(listSurah[i]["surat_name"])

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        for(int i=0;i<(listDoa.length);i++)
                          (favoriteDoa.contains(listDoa[i]['judul'].toString())) ?
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey,width: 0.3)
                            ),

                            child: ListTile(

                              onTap: (){
                                // print(i.toString());
                                Navigator.push(context, Transition(DoaItem(i)));
                              },
                              title: Text(listDoa[i]['judul'].toString(),style: TextStyle(color: isDark == true? Colors.white : Colors.black)),
                              trailing: IconButton(
                                onPressed: (){
                                  // print(listDoa[i]['judul']);
                                  setState(() {

                                    setDataDoa(listDoa[i]['judul'].toString());
                                  });


                                },
                                icon: !favoriteDoa.contains(listDoa[i]['judul'].toString()) ?
                                Icon(Icons.favorite_border_rounded,size: 30)
                                    : Icon(Icons.favorite,size: 30,color: Colors.redAccent,),
                              ),
                            ),
                          ): Container()
                        // Text(listDoa[i]["surat_name"])

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
