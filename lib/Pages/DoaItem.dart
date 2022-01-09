import 'package:flutter/material.dart';
import '../main.dart';

class DoaItem extends StatefulWidget {
  int idDoa;
  DoaItem(this.idDoa);



  @override
  _DoaItemState createState() => _DoaItemState();

}

class _DoaItemState extends State<DoaItem> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readJsonListDoa(),
        builder: (context,data){
        if(data.connectionState == ConnectionState.waiting){
          return spinkit;
          }
        else{
          return  MaterialApp(
            theme: isDark == true ? ThemeData.dark() : ThemeData.light(),
            home: Scaffold(
                appBar: AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).pop();

                      },
                          icon: Icon(Icons.arrow_back)),
                      Text(listDoa[widget.idDoa]['judul']),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.transparent,))
                    ],
                  ),
                ),
                //
                body: ListView(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: Card(
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        child: Text(listDoa[widget.idDoa]['arab'],textAlign: TextAlign.end,style: TextStyle(fontSize: 26))),
                                    //
                                    SizedBox(height: 10,),
                                    Text(listDoa[widget.idDoa]["latin"].toString(),textAlign: TextAlign.start,style: TextStyle(color: Colors.red,fontSize: 16),),
                                    SizedBox(height: 15,),
                                    Text(listDoa[widget.idDoa]["arti"].toString(),textAlign: TextAlign.start,style: TextStyle(fontSize: 16),),
                                    // Text(listDoa[widget.idDoa]["art"].toString(),textAlign: TextAlign.end,style: TextStyle(fontSize: 16),),
                                  ],
                                )
                            ),
                          ),
                        )
                      ],
                    )

                  ],
                )
            ),
          );
        }

        }
    );
  }
}
