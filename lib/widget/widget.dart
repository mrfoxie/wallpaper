import 'package:flutter/material.dart';
import 'package:mrfoxie/model/wallpaper_model.dart';

Widget mrFoxie() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Mr. ",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: 25.0,
        ),
      ),
      Text(
        "Foxie",
        style: TextStyle(
          color: Colors.deepOrange,
          fontWeight: FontWeight.w900,
          fontSize: 25.0,
        ),
      ),
    ],
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: Container(
            child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover,),
          ),
        );
      }).toList(),
    ),
  );
}
