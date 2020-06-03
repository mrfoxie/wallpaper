import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrfoxie/model/wallpaper_model.dart';
import 'package:mrfoxie/view/Image_View.dart';

Widget mrFoxie() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      RichText(
        text: TextSpan(
          text: '',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25.0),
          children: <TextSpan>[
            TextSpan(
                text: 'Mr',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            TextSpan(
                text: 'Foxie',
                style: TextStyle(
                  color: Colors.deepOrange,
                )),
          ],
        ),
      ),
    ],
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 25.0),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.5,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageView(
                    imgUrl: wallpaper.src.portrait,
                  ),
                ),
              );
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    wallpaper.src.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
