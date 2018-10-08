part of flutter_fab_dialer;

typedef void OnFabMiniMenuItemPressed();

typedef void HideWidget();

class FabMiniMenuItem {
  double elevation;
  String text;
  Icon icon;
  ImageProvider image;
  Color fabColor;
  Color chipColor;
  String tooltip;
  Color textColor;
  AnimationStyle animationStyle;
  OnFabMiniMenuItemPressed onPressed;
  bool hideOnClick;

  FabMiniMenuItem.withText(
      this.icon,
      this.fabColor,
      this.elevation,
      this.tooltip,
      this.onPressed,
      this.text,
      this.chipColor,
      this.textColor,
      this.hideOnClick);

  FabMiniMenuItem.withTextWithImage(
      this.image,
      this.elevation,
      this.tooltip,
      this.onPressed,
      this.text,
      this.chipColor,
      this.textColor,
      this.hideOnClick) {
    this.fabColor = null;
  }

  FabMiniMenuItem.noText(this.icon, this.fabColor, this.elevation, this.tooltip,
      this.onPressed, this.hideOnClick) {
    this.text = null;
    this.chipColor = null;
    this.textColor = null;
    this.image = null;
  }

  FabMiniMenuItem.noTextWithImage(this.image, this.elevation, this.tooltip,
      this.onPressed, this.hideOnClick) {
    this.text = null;
    this.chipColor = null;
    this.textColor = null;
    this.fabColor = null;
  }
}

class FabMenuMiniItemWidget extends StatelessWidget {
  const FabMenuMiniItemWidget(
      {Key key,
      this.elevation,
      this.text,
      this.icon,
      this.image,
      this.fabColor,
      this.chipColor,
      this.textColor,
      this.tooltip,
      this.index,
      this.controller,
      this.onPressed,
      this.hideWidget,
      this.animationStyle,
      this.itemCount})
      : super(key: key);
  final double elevation;
  final String text;
  final Icon icon;
  final ImageProvider image;
  final Color fabColor;
  final Color chipColor;
  final String tooltip;
  final Color textColor;
  final int index;
  final int itemCount;
  final OnFabMiniMenuItemPressed onPressed;
  final HideWidget hideWidget;
  final AnimationController controller;
  final AnimationStyle animationStyle;

  Widget _buildAnimation(BuildContext context, Widget child) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    switch (animationStyle) {
      case AnimationStyle.fadeIn: //fadeIn
        return new Container(
          child: new Opacity(
            opacity: new Tween<double>(
              begin: 0.0,
              end: 1.0,
            )
                .animate(
                  new CurvedAnimation(
                    parent: controller,
                    curve: new Interval(
                      0.100,
                      0.900,
                      curve: Curves.easeIn,
                    ),
                  ),
                )
                .value,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: _getChip(),
                  ),
                  new Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: _getFloatingActionButton()),
                ],
              ),
            ),
          ),
        );
      case AnimationStyle.slideInDown: // slideInDown:
        return new Container(
          padding: new EdgeInsetsTween(
            end: const EdgeInsets.only(bottom: 0.0),
            begin: EdgeInsets.only(top: deviceHeight / itemCount / 3),
          )
              .animate(
                new CurvedAnimation(
                  parent: controller,
                  curve: new Interval(
                    0.100,
                    0.600,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
              )
              .value,
          child: new Opacity(
            opacity: new Tween<double>(
              begin: 0.0,
              end: 1.0,
            )
                .animate(
                  new CurvedAnimation(
                    parent: controller,
                    curve: new Interval(
                      0.100,
                      0.600,
                      curve: Curves.ease,
                    ),
                  ),
                )
                .value,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: _getChip(),
                  ),
                  new Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: _getFloatingActionButton()),
                ],
              ),
            ),
          ),
        );
      default:
        return new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 8.0),
                child: new ScaleTransition(
                  scale: new CurvedAnimation(
                    parent: controller,
                    curve: new Interval(((index + 1) / 10), 1.0,
                        curve: Curves.linear),
                  ),
                  child: _getChip(),
                ),
              ),
              new ScaleTransition(
                scale: new CurvedAnimation(
                  parent: controller,
                  curve: new Interval(((index + 1) / 10), 1.0,
                      curve: Curves.linear),
                ),
                child: _getFloatingActionButton(),
              )
            ],
          ),
        );
    }
  }

  Widget _getChip() {
    return chipColor != null
        ? new Chip(
            backgroundColor: chipColor,
            label: new Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style:
                  new TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          )
        : null;
  }

  Widget _getFloatingActionButton() {
    return fabColor != null
        ? new FloatingActionButton(
            elevation: elevation,
            mini: true,
            backgroundColor: fabColor,
            tooltip: tooltip,
            child: icon,
            heroTag: "$index",
            onPressed: () {
              onPressed();
              hideWidget == null ? null : hideWidget();
            })
        : new FloatingActionButton(
            elevation: elevation,
            tooltip: tooltip,
            mini: true,
            child: new ConstrainedBox(
              constraints: new BoxConstraints.expand(),
              child: new Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            heroTag: "$index",
            onPressed: () {
              onPressed();
              hideWidget == null ? null : hideWidget();
            });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new AnimatedBuilder(
            builder: _buildAnimation,
            animation: controller,
          ),
        ],
      ),
    );
  }
}
