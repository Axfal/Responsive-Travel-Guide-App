import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../model/places.dart';

Widget buildMenuItem(int index, double fontSize)=> ListTile(
  leading: Icon(Icons.location_city_outlined),
  title: AutoSizeText(allPlace[index-1].title.toString(),style: TextStyle(fontSize: 18),),
);