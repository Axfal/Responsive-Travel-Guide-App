import 'package:flutter/material.dart';
import 'package:untitled/model/place_model.dart';
import 'package:untitled/model/places.dart';
import 'package:untitled/view/details_page.dart';

import 'grid_item_widget.dart';

class PlaceGalleryWidget extends StatelessWidget {
  final ValueChanged<Place> onPlaceChange;
  final bool isHorizontal;

  const PlaceGalleryWidget({
    super.key,
    required this.onPlaceChange,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: GridView.count(
        crossAxisCount: isHorizontal ? 1 : 2,
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        children: allPlace.map<Widget>((place) {
          return GridItemWidget(
            place: place,
            onPlaceChange: (){
              // Trigger state change callback
              onPlaceChange(place);
              // Navigate to DetailsPage
              if(isHorizontal){
                return;
              } else{Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(place: place),
                ),
              );}
            },
          );
        }).toList(),
      ),
    );
  }
}
