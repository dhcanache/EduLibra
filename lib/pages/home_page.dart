
import 'dart:ui';
import 'package:book_shop/data/json.dart';
import 'package:book_shop/theme/colors.dart';
import 'package:book_shop/widgets/avatar_image.dart';
import 'package:book_shop/widgets/book_card.dart';
import 'package:book_shop/widgets/book_cover.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: bottomBarColor,
           //backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Bolibra"),
                  )
              ),
              Icon(Icons.search_rounded),
          ],),
        ),
        body: getStackBody(),
      );
  }

  getTopBlock(){
    return 
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
              color: bottomBarColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 35, right:15),
                    child: Text("Hola, internauta", style: TextStyle(color: secondary,fontSize: 23, fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(left: 35, right:15),
                    child: Text("Bienvenido a Bolibra", style: TextStyle(color: secondary,fontSize: 15, fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 35,),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text("Primaria", style: TextStyle(color: secondary,fontSize: 18, fontWeight: FontWeight.w600),)
                  ),
                  SizedBox(height: 15,),
              ],
            ),
          ),
          Container(
            height: 150,
            color: primary,
            child: Container(
              decoration: BoxDecoration(
                color: appBgColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(100))
              ),
            ),
          )
        ],
      );
  }

  getStackBody(){
    return SingleChildScrollView(
      child: Column(
        children :[ 
          Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  child: getTopBlock(),
                ),
                Positioned(
                  top: 140,
                  left: 0, right: 0,
                  child: Container(
                    height: 260,
                    child: getLatestBooks(),
                  )
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Text("Secundaria", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: getPopularBooks(),
              ),
              SizedBox(height: 15,),
            ],
          ),
        ],
      ),
    );
  }

  getPopularBooks(){
    return
      SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 5, left: 15),
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(popularBooks.length, 
            (index) => BookCard(book: popularBooks[index])
          ),
        ),
      );
  }

  getLatestBooks(){
    return
      SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 5, left: 15),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(latestBooks.length, 
            (index) => BookCard(book: latestBooks[index])
          ),
        ),
      );
  }

}
