
# Introduction

This is a Widget build for having an alternative to default menus

## Usage
### Create a list with your desired elements and customize each one
```dart
 List<FabMiniMenuItem> fabMiniMenuItemList = new List();
    _fabMiniMenuItemList.add(new FabMiniMenuItem(
       onPressed: _incrementCounter,
      textColor: Colors.white,
      chipColor: Colors.blue,
      fabColor: Colors.blue,
      icon: new Icon(Icons.add),
      elevation: 4.0,
      text: "Click me",
      tooltip: "Button menu",

    ));
```

### Add the Dialer to your UI
```dart
//Using a Stack will assure that the Dialer will appear at the end of your layout
 new Stack(
          children: <Widget>[
            new Center(
                child: new Column(
                  children: <Widget>[
                    new Text(
                      'You have pushed the button this many times:',
                    ),
                    new Text(
                      '${_counter}',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                )

            ),
              new FabDialer(_fabMiniMenuItemList,Colors.blue,new Icon(Icons.add)),
                    ],
        ));
```

Inline-style: 
![alt text](https://github.com/Leondev7/flutter_fab_dialer/tree/master/src/demo.gif )

