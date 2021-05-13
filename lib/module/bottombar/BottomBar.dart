import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final Color selectedIconColor;
  final Color iconColor;
  final int initialSelectedIndex;
  final Color bgColor;
  final double iconSize;
  final double textSize;
  final List<int> badgeCount;
  final TabController controller;
  BottomBar(
      {Key key,
      this.selectedIconColor,
      this.iconColor,
      this.initialSelectedIndex = 0,
      this.bgColor,
      this.iconSize = 30,
      this.textSize = 12,
      this.badgeCount,
      this.controller})
      : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Color _selectedIconColor = Color(0xff075E55);
  Color _iconColor = Color(0xffA7B1B7);
  Color _bgColor = Color(0xffE2E7EA);
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _selectedIconColor = widget.selectedIconColor ?? _selectedIconColor;
    _iconColor = widget.iconColor ?? _iconColor;
    _bgColor = widget.bgColor ?? _bgColor;
    if (widget.controller != null) {
      widget.controller.addListener(() {
        setState(() {
          selectedIndex = widget.controller.index;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _bgColor,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildItemsbar()),
    );
  }

  List<Widget> _buildItemsbar() {
    List<String> label = ["Chat", "Panggilan", "Akun Saya"];
    List<IconData> icon = [
      CupertinoIcons.chat_bubble_2_fill,
      CupertinoIcons.phone_fill,
      CupertinoIcons.person_fill
    ];
    List<Widget> wTmp = [];
    for (int i = 0; i < label.length; i++) {
      Color wColor = selectedIndex == i ? _selectedIconColor : _iconColor;
      int bCount = widget.badgeCount == null ? 0 : widget.badgeCount[i];
      wTmp.add(TextButton(
        style: TextButton.styleFrom(primary: _bgColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              width: 80,
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    icon[i],
                    color: wColor,
                    size: widget.iconSize,
                  ),
                  Positioned(
                    child: _buildBadge(bCount),
                    left: 40,
                    bottom: 20,
                  )
                ],
              ),
            ),
            Text(
              label[i],
              style: TextStyle(color: wColor, fontSize: widget.textSize),
            ),
          ],
        ),
        onPressed: () {
          setState(() {
            selectedIndex = i;
            if (widget.controller != null) widget.controller.animateTo(i);
          });
        },
      ));
    }
    return wTmp;
  }

  Widget _buildBadge(int count) {
    return count == 0
        ? Container()
        : Container(
            height: 25,
            width: 25,
            alignment: Alignment.center,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Color(0xff35A897),
                border: Border.all(color: Color(0xffE2E7EA), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Text(
              "$count",
              style: TextStyle(fontSize: 12),
            ),
          );
  }
}
