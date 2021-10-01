import 'package:flutter/material.dart';
import 'package:ustam/models/provider.dart';

class ProviderRatings extends StatelessWidget {
  final Provider provider;

  const ProviderRatings({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("${provider.name}'s Ratings");
  }
}