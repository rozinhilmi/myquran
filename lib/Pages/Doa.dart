import 'package:flutter/material.dart';
import 'DoaItem.dart';

import '../main.dart';
import 'Surat.dart';

class HalamanDoa extends StatefulWidget {
  // const HalamanDoa({Key? key}) : super(key: key);

  @override
  _HalamanDoaState createState() => _HalamanDoaState();
}

class _HalamanDoaState extends State<HalamanDoa> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJsonListDoa(),
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
                      for(int i=0;i<(listDoa.length);i++)
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
                        )
                      // Text(listDoa[i]["surat_name"])

                    ],
                  ),
                ),
              ],
            );
          }
    });
    // return Container();

  }
}

































