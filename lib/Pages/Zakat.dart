import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class Zakat extends StatefulWidget {
  // const Zakat({Key? key}) : super(key: key);

  @override
  _ZakatState createState() => _ZakatState();
}

class _ZakatState extends State<Zakat> {
  @override
  Widget build(BuildContext context) {
    double kebutuhanBulanan = 0;
    double pendapatanBulanan = 0;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(

        children: [
          TextField(
            onChanged: (valuekey){
              pendapatanBulanan = int.parse(valuekey).toDouble();
            },
            decoration: InputDecoration(

              labelText: "Jumlah Pengahasilan Bulanan",
            ),

          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (valuekey){
              kebutuhanBulanan = int.parse(valuekey).toDouble();
            },
            decoration: InputDecoration(

              labelText: "Jumlah Kebutuhan Bulanan",
            ),

          ),
          SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: isDark == false ? Colors.blue : Colors.grey
            ),
              onPressed: (){
                setState(() {
                  hasilZakat = (pendapatanBulanan*12)-(kebutuhanBulanan*12);
                  hasilZakat = (2.5/100) * hasilZakat;
                  print(hasilZakat);
                });
              },
              child: Text("Hitung")
          ),
          SizedBox(height: 20,),
          Text("hasil Zakat = "+hasilZakat.toString(),style: TextStyle(fontSize: 20),)
        ],
      ),
    );


  }
}
