import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:ustam/models/styles.dart';
import 'package:ustam/pages/provider/provider_detail.page.dart';

class Provider {
  int id;
  String name;
  String phoneNum;
  String address;
  LatLng location;
  double rate;
  String status;
  int rating;
  NetworkImage profilePic;
  String occupation;
  List<String> skills;
  String description;
  DateTime createdAt;
  Map<String, dynamic> education;

  Provider(
      this.id,
      this.name,
      this.phoneNum,
      this.address,
      this.rate,
      this.location,
      this.rating,
      this.status,
      this.profilePic,
      this.occupation,
      this.skills,
      this.description,
      this.createdAt,
      this.education);

  List<Widget> getRatings() {
    List<Widget> ratings = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        ratings.add(Icon(Icons.star, color: Colors.lime[500]));
      } else {
        ratings.add(const Icon(Icons.star_border, color: Colors.black));
      }
    }
    return ratings;
  }

  buildHero(BuildContext context) {
    return Hero(
        child: Material(
            color: Colors.transparent,
            child: Wrap(
              spacing: 16,
              alignment: WrapAlignment.center,
              children: <Widget>[
                Image(
                  width: 48,
                  height: 48,
                  image: profilePic,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name, style: techCardTitleStyle),
                    Text(occupation, style: techCardSubTitleStyle)
                  ],
                )
              ],
            )),
        tag: id);
  }

  Widget buildCardBody(BuildContext context) {
    return Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Text("Status:  ", style: techCardSubTitleStyle),
                    Text(status, style: statusStyles[status])
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Rating: ", style: techCardSubTitleStyle),
                    Row(children: getRatings())
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Phone: $phoneNum", style: techCardSubTitleStyle),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Description: ", style: techCardSubTitleStyle),
                  ],
                ),
              )
            ]);
  }

  Widget buildCard(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProviderDetail(provider: this)));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 20),
          width: 256,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8.0)],
          ),
          child: Column(
            children: <Widget>[buildHero(context), buildCardBody(context)],
          ),
        ));
  }
}
