part of flutter_fab_dialer;

class FabDialer extends StatefulWidget {
  // AnimationStyle is an optional parameter to avoid breaking changes
  const FabDialer(this._fabMiniMenuItemList, this._fabColor, this._fabIcon,
      [this._fabAnimationStyle = AnimationStyle.defaultAnimation]);

  final List<FabMiniMenuItem> _fabMiniMenuItemList;
  final Color _fabColor;
  final Icon _fabIcon;
  final AnimationStyle _fabAnimationStyle;

  @override
  FabDialerState createState() => new FabDialerState(
      _fabMiniMenuItemList, _fabColor, _fabIcon, _fabAnimationStyle);
}

class FabDialerState extends State<FabDialer> with TickerProviderStateMixin {
  FabDialerState(this._fabMiniMenuItemList, this._fabColor, this._fabIcon,
      this._fabAnimationStyle);

  int _angle = 90;
  bool _isRotated = true;
  final List<FabMiniMenuItem> _fabMiniMenuItemList;
  final Color _fabColor;
  final Icon _fabIcon;
  final AnimationStyle _fabAnimationStyle;
  List<FabMenuMiniItemWidget> _fabMenuItems;

  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    _controller.reverse();

    setFabMenu(this._fabMiniMenuItemList);
    super.initState();
  }

  void setFabMenu(List<FabMiniMenuItem> fabMenuList) {
    List<FabMenuMiniItemWidget> fabMenuItems = new List();
    for (int i = 0; i < _fabMiniMenuItemList.length; i++) {
      fabMenuItems.add(new FabMenuMiniItemWidget(
        tooltip: _fabMiniMenuItemList[i].tooltip,
        text: _fabMiniMenuItemList[i].text,
        elevation: _fabMiniMenuItemList[i].elevation,
        icon: _fabMiniMenuItemList[i].icon,
        image: _fabMiniMenuItemList[i].image,
        index: i,
        onPressed: _fabMiniMenuItemList[i].onPressed,
        textColor: _fabMiniMenuItemList[i].textColor,
        fabColor: _fabMiniMenuItemList[i].fabColor,
        chipColor: _fabMiniMenuItemList[i].chipColor,
        controller: _controller,
        animationStyle: _fabAnimationStyle,
        itemCount: _fabMiniMenuItemList.length,
        // Send item count to each item to help animation calc
        hideWidget:
            _fabMiniMenuItemList[i].hideOnClick == false ? null : _rotate,
      ));
    }

    this._fabMenuItems = fabMenuItems;
  }

  void _rotate() {
    setState(() {
      if (_isRotated) {
        _angle = 45;
        _isRotated = false;
        _controller.forward();
      } else {
        _angle = 90;
        _isRotated = true;
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _fabMenuItems,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new FloatingActionButton(
                    child: new RotationTransition(
                      turns: new AlwaysStoppedAnimation(_angle / 360),
                      child: _fabIcon,
                    ),
                    backgroundColor: _fabColor,
                    onPressed: _rotate)
              ],
            ),
          ],
        ));
  }
}
