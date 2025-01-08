import 'package:flutter/material.dart';
import 'package:untitled/model/place_model.dart';

class GridItemWidget extends StatelessWidget {
  final Place place;
  final VoidCallback onPlaceChange;

  const GridItemWidget({
    super.key,
    required this.place,
    required this.onPlaceChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: onPlaceChange,
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              place.title,
              style: const TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              place.subtitle,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          child: Ink.image(
            image: AssetImage(place.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
