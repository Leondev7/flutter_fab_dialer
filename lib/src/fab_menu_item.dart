part of flutter_fab_dialer;

typedef void OnFabMiniMenuItemPressed();

class FabMiniMenuItem {
   double elevation;
   String text;
   Icon icon;
   Color fabColor;
   Color chipColor;
   String tooltip;
   Color textColor;
   OnFabMiniMenuItemPressed onPressed;



   FabMiniMenuItem.withText(
      this.icon,
       this.fabColor,
       this.elevation,
       this.tooltip,
       this.onPressed,
       this.text,
       this.chipColor,
       this.textColor);

  FabMiniMenuItem.noText(this.icon,this.fabColor,this.elevation,this.tooltip,this.onPressed){
    this.text = null;
    this.chipColor = null;
    this.textColor = null;
  }


}

class FabMenuMiniItemWidget extends StatelessWidget {
  const FabMenuMiniItemWidget(
      {Key key,
      this.elevation,
      this.text,
      this.icon,
      this.fabColor,
      this.chipColor,
      this.textColor,
      this.tooltip,
      this.index,
      this.controller,
      this.onPressed})
      : super(key: key);
  final double elevation;
  final String text;
  final Icon icon;
  final Color fabColor;
  final Color chipColor;
  final String tooltip;
  final Color textColor;
  final int index;
  final OnFabMiniMenuItemPressed onPressed;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
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
                    child: chipColor!=null
                        ?new Chip(
                      label: new Text(
                        text,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: chipColor,
                    ):null)),
            new ScaleTransition(
              scale: new CurvedAnimation(
                parent: controller,
                curve:
                    new Interval(((index + 1) / 10), 1.0, curve: Curves.linear),
              ),
              child: new FloatingActionButton(
                  elevation: elevation,
                  mini: true,
                  backgroundColor: fabColor,
                  tooltip: 'Increment',
                  child: icon,
                  onPressed: onPressed),
            )
          ],
        ));
  }
}
