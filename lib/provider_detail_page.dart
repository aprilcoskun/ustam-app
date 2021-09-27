import 'package:flutter/material.dart';
import 'package:ustam/models/provider.dart';

class ProviderDetail extends StatefulWidget {
  final Provider provider;

  const ProviderDetail({Key? key, required this.provider}) : super(key: key);
  @override
  _ProviderDetailState createState() => _ProviderDetailState();
}

class _ProviderDetailState extends State<ProviderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 180,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  // top: MediaQuery.of(context).padding.top,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      color: Colors.lime,
                    ),
                    height: 128,
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 40,
                  right: 38,
                  child: Container(
                    height: 64,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.of(context).pop(),
                          splashColor: Colors.white,
                          splashRadius: 100,
                        ),
                        const Spacer(),
                        const Text(
                          "Provider",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 96,
                  left: 16,
                  right: 16,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          widget.provider.buildHero(context),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            child: widget.provider.buildCardBody(context),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          const SizedBox(height: 40),
        ],
      ),
    ));
  }
}
