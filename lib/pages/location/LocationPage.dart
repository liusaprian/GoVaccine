import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_vaccine/themes.dart';
import 'package:go_vaccine/widgets/LocationCard.dart';
import 'package:latlong2/latlong.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  @override
  Widget build(BuildContext context) {

    Widget map() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.45,
        child: FlutterMap(
          options: MapOptions(
            zoom: 18,
            center: LatLng(-6.146763085343899, 106.82981522739834)
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: [
                'a',
                'b',
                'c'
              ]
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80,
                  height: 80,
                  point: LatLng(-6.146763085343899, 106.82981522739834),
                  builder: (context) {
                    return Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on,
                          color: primaryColor,
                        ),
                      ),
                    );
                  }
                )
              ]
            )
          ],
        )
      );
    }

    Widget searchBar() {
      return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: subtitleTextColor,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
          color: white,
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.only(top: 20),
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: blackTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: '\"Rumah Sakit Husada\"',
                      hintStyle: hintTextStyle
                  ),
                )
              ),
              Icon(
                Icons.search,
                color: primaryColor,
              )
            ],
          ),
        ),
      );
    }

    Widget nearbyLocation() {
      return Container(
        height: 140,
        margin: EdgeInsets.only(top: 12),
        child: Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return LocationCard();
            },
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      child: ListView(
        children: [
          map(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dekat Lokasimu',
                  style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold
                  ),
                ),
                searchBar(),
                nearbyLocation()
              ],
            )
          ),
        ],
      ),
    );
  }
}
