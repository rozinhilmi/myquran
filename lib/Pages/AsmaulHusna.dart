import 'package:flutter/material.dart';
import '../main.dart';
class AsmaulHusna extends StatefulWidget {
  const AsmaulHusna({Key? key}) : super(key: key);

  @override
  _AsmaulHusnaState createState() => _AsmaulHusnaState();
}

class _AsmaulHusnaState extends State<AsmaulHusna> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJsonAsmaulHusna(),
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
                      for(int i=0;i<(listAsmaulHusna.length);i++)
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey,width: 0.3)
                          ),
                          // color: Colors.pink,
                          child: ListTile(
                            onTap: (){},
                            title: Text(listAsmaulHusna[i]['latin'].toString(),style: TextStyle(color: isDark == true? Colors.white : Colors.black)),
                            subtitle: Text(listAsmaulHusna[i]['arti'].toString(),style: TextStyle(color: isDark == true? Colors.white : Colors.black)),
                            leading: CircleAvatar(
                              backgroundColor: isDark == true ? Colors.black.withOpacity(.5) : Colors.blue,
                              child: Text(replaceFarsiNumber(listAsmaulHusna[i]['urutan'].toString()),style: TextStyle(color: Colors.white)),
                            ),
                            trailing: Text(listAsmaulHusna[i]['arab'].toString(),style: TextStyle(color: isDark == true? Colors.white : Colors.black)),
                          ),
                        ),
                      // Text(listAsmaulHusna[i]["surat_name"])

                    ],
                  ),
                ),
              ],
            );
          }

        });
  }
}
