import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget buildHeader(double fontSize)=> DrawerHeader(
  decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage('assets/images/gilgit2.jpg',),fit: BoxFit.cover)
  ),
  child: AutoSizeText('Pakistan',
    minFontSize: 18,
    maxFontSize: 22,
    style: TextStyle(
  color:Colors.white,
),),);