import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:untitled/model/place_model.dart';


class DetailsPage extends StatelessWidget {
  final Place place;
  const DetailsPage({super.key, required this.place,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: (_,constraints)=>
      constraints.maxWidth>=600? buildLargeWidget():
      buildSmallWidget()),
    );
  }
  Widget buildSmallWidget()=> ListView(
    children: [
      Image(
        height: 320,
        width: double.infinity,
        fit: BoxFit.cover,
        image: AssetImage(place.image),
      ),
      buildItem(18),
      buildIconButtonRow(Colors.green),
      buildDescription()
    ],
  );

  Widget buildLargeWidget()=> Card(
    clipBehavior: Clip.antiAlias,
    elevation: 6,
    margin: EdgeInsets.all(10),
    child: SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Image(
                  height: 320,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: AssetImage(place.image),
                ),
                buildItem(14),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                buildIconButtonRow(Colors.green),
                buildDescription()
              ],
            ),
          )
        ],
      ),
    ),
  );

  Widget buildItem(double fontSize) => Container (
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  minFontSize: 12,
                  maxFontSize: 18,
                  place.title,
                  style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  place.subtitle,
                  style: TextStyle(color: Colors.black54, fontSize:fontSize),
                )
              ],
            ),
            SizedBox(
              child: Row(
                children: [Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('41')],
              ),
            )

          ],
        ),
      );
  Widget buildIconButtonRow(Color color)=> Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildIconButton('Call', color, Icons.call),
      buildIconButton('Route', color, Icons.near_me),
      buildIconButton('Share', color, Icons.share)
    ],
  );
  Widget buildDescription()=> Padding(
    padding: EdgeInsets.all(24.0),
    child: Text(place.description,
      style: TextStyle(fontSize: 16),
    ),
  );


  Widget buildIconButton(String label, Color color, IconData icon)=> Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,color: color,),
        SizedBox(height: 8,),
        Text(label,style: TextStyle(fontSize: 12,color: color),)
      ],
    ),
  );
}
