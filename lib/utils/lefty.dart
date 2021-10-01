import 'package:flutter/material.dart';

class LeftWidget extends StatefulWidget {
  final void Function(String, int) onTabChangeCallback;
  final List<String> tabList;
  const LeftWidget({Key? key, required this.onTabChangeCallback, required this.tabList}) : super(key: key);

  @override
  _LeftWidgetState createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> with TickerProviderStateMixin {

  late List<GlobalKey> _keys;

  int checkIndex = 0;

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(widget.tabList.length, (i) => GlobalKey());
  }

  void indexChecked(int i) {
    if (checkIndex == i) return;

    setState(() {
      checkIndex = i;

      widget.onTabChangeCallback(widget.tabList[i], i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(color: Color(0xFF4ADBC8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildList(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildList() {
    List<Widget> _widgetList = [];
    for (var i = 0; i < widget.tabList.length; i++) {
      _widgetList.add(
        GestureDetector(
            onTap: () => indexChecked(i),
            child: Container(
              width: 48,
              child: Center(
                  child: RotatedBox(
                key: _keys[i],
                quarterTurns: 3,
                child: Text(
                  widget.tabList[i],
                  style: TextStyle(
                    color: checkIndex == i ? Colors.black : const Color(0xFF4D5B48),
                    fontSize: 16,
                  ),
                ),
              )),
              decoration: BoxDecoration(
                  border: checkIndex == i
                      ? const Border(right: BorderSide(color: Colors.black))
                      : null),
            )),
      );
    }

    return _widgetList;
  }
}
