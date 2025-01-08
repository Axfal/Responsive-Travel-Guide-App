import 'package:flutter/material.dart';
import 'package:untitled/model/places.dart';
import 'package:untitled/view/details_page.dart';
import 'package:untitled/widgets/drawer_widget.dart';
import 'package:untitled/widgets/place_gallery_widget.dart';
import 'package:untitled/widgets/responsive_widget.dart';

import 'model/place_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Place selectedPlace = allPlace[0];
  void changePlace(Place place) => setState(() => selectedPlace = place);
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(
          color: Colors.white, // Change drawer icon color to white
        ),
        automaticallyImplyLeading: true,
        title: Text(
          'Travel Guide App',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: isMobile ? DrawerWidget() : null,
      body: ResponsiveWidget(
          mobile: buildMobile(),
          tablet: buildTablet(),
          desktop: buildDesktop()),
    );
  }

  buildMobile() {
    return PlaceGalleryWidget(
      onPlaceChange: (Place value) {},
    );
  }

  buildTablet() {
    return Row(
      children: [
        Expanded(flex: 2, child: DrawerWidget()),
        Expanded(
            flex: 5,
            child: PlaceGalleryWidget(
              onPlaceChange: (Place value) {},
            ))
      ],
    );
  }

  buildDesktop() {
    return Row(
      children: [
        Expanded(child: DrawerWidget()),
        Expanded(flex: 3, child: buildBody())
      ],
    );
  }

  Widget buildBody() => Container(
        padding: EdgeInsets.all(10),
        color: Colors.green[200],
        child: Column(
          children: [
            Expanded(
                child: PlaceGalleryWidget(
              onPlaceChange: (
                Place value,
              ){
                setState(() {
                  selectedPlace = value;
                });
              },
              isHorizontal: true,
            )),
            Expanded(child: DetailsPage(place: selectedPlace))
          ],
        ),
      );
}
