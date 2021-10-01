import 'package:flutter/material.dart';
import 'package:ustam/models/provider.dart';

class ProviderServices extends StatelessWidget {
  final Provider provider;

  const ProviderServices({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("${provider.name}'s Services");
  }
}