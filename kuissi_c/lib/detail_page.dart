import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuissi_c/groceries.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailPage extends StatefulWidget {
  final Groceries barang;

  const DetailPage ({Key? key, required this.barang}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: (isFavorite) ? Colors.black12: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text ("${widget.barang.name}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: (MediaQuery
                .of(context)
                .size
                .height) / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal:8),
                  child: Image.network(widget.barang.productImageUrls[index]),
                );
              },
              itemCount: widget.barang.productImageUrls.length,
            ),
          ),
          Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textBesar(widget.barang.name),
                  SizedBox(height: 10,),
                  SizedBox(height: 10,),
                  textBesar("Harga barang : " + widget.barang.price),
                  SizedBox(height: 10,),
                  textBesar("Stock : " + widget.barang.stock),
                  SizedBox(height: 10,),
                  textSedang("Deskripsi : " + widget.barang.description),
                  SizedBox(height: 20,),
                  textBesar("Promo: " + widget.barang.discount),
                  SizedBox(height: 10,),
                  textBesar("From: " + widget.barang.storeName),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height)/10,
                    width: (MediaQuery.of(context).size.width),
                  ),
                  Card(
                    color: Colors.lightGreenAccent,
                    child: ElevatedButton(
                      onPressed: () {
                        _launchURL(widget.barang.productUrl);
                      },
                      child: Text("Halaman Website"),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
      ),
    );
  }
  Widget textBesar(String text){
    return Text(
      text,
      style: TextStyle(fontSize: 20),
    );
  }
  Widget textSedang(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

}

