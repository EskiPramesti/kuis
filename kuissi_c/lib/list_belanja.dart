import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'groceries.dart';


class ListBelanja extends StatefulWidget {
  const ListBelanja({Key? key}) : super(key: key);

  @override
  State<ListBelanja> createState() => _ListBelanjaState();
}
class _ListBelanjaState extends State<ListBelanja> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Belanja'),
        backgroundColor: Colors.pink,
      ),
      body:ListView.builder(
        itemBuilder: (context,index) {
          final Groceries barang = groceryList[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context){
                  return DetailPage(barang: barang);
                }));
              },
              child: Container(
                height: (MediaQuery.of(context).size.height)/4,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.network(barang.productImageUrls[0], fit: BoxFit.cover, width: MediaQuery.of(context).size.width, color: Colors.black45, colorBlendMode: BlendMode.darken,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textAlignLeftWhite(barang.name),
                        // textAlignLeftWhite(barang.ticketPrice)
                      ],
                    ),
                  ],
                ),
              ),

            ),
          );
        },
        itemCount:groceryList.length,
      ),
    );
  }
}
Widget textAlignLeftWhite(String text){
  return Text(
    text,
    textAlign: TextAlign.left,
    style: TextStyle(
      color:Colors.white,
      fontSize: 30,
    ),
  );
}