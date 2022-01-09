import 'package:flutter/material.dart';
import '../main.dart';
import 'Surat.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: readJsonListSurah(),
        builder: (context,data){
          if(data.connectionState == ConnectionState.waiting){
            return spinkit;
          }
          else{
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      for(int i=0;i<(listSurah.length);i++)
                        (listSurah[i]['nama'].toString().toLowerCase()).contains(alquranSearch.toLowerCase()) ?
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
            );
          }

      }
    );





  }
}
