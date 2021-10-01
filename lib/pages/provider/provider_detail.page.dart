import 'package:flutter/material.dart';
import 'package:ustam/models/provider.dart';
import 'package:ustam/pages/provider/widgets/about.dart';
import 'package:ustam/pages/provider/widgets/ratings.dart';
import 'package:ustam/pages/provider/widgets/services.dart';

import '../../utils/lefty.dart';

class ProviderDetail extends StatefulWidget {
  final Provider provider;

  const ProviderDetail({Key? key, required this.provider}) : super(key: key);
  @override
  _ProviderDetailState createState() => _ProviderDetailState();
}

class _ProviderDetailState extends State<ProviderDetail>
    with TickerProviderStateMixin {
  final List<String> _list = ["About", "Services", "Ratings"];
  final pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 72,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFF4ADBC8)),
                    height: 72,
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 4,
                  right: 0,
                  child: SizedBox(
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
                        widget.provider.buildHero(context),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height - 181,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LeftWidget(
                    onTabChangeCallback: (name, index) {
                      pageController.jumpToPage(index);
                    },
                    tabList: _list,
                  ),
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {},
                      controller: pageController,
                      // the number of pages
                      itemCount: _list.length,
                      // building pages
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                          child: getPageWidget(index),
                        );
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    ));
  }

  Widget getPageWidget(index) {
    switch (_list[index]) {
      case "About":
        return ProviderAbout(provider: widget.provider);
      case "Services":
        return ProviderServices(provider: widget.provider);
      case "Ratings":
        return ProviderRatings(provider: widget.provider);
      default:
        return Text(_list[index]);
    }
  }
}
