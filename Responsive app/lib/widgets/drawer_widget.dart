import 'package:flutter/material.dart';
import 'package:untitled/model/places.dart';

import 'buid_header.dart';
import 'build_menu_item.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * .025;
    return ListView.builder(
        itemCount: allPlace.length+1 ,
        itemBuilder: (context,index){
          return index==0? buildHeader(fontSize): buildMenuItem(index , fontSize);
    });
  }
}
