
# Introduction

This is a Widget build for having an alternative to default menus

![alt text](https://github.com/Leondev7/flutter_fab_dialer/blob/master/src/demo.gif )

####There are two types of fab menu items
 One with text associated
```dart
   FabMiniMenuItem.withText(
       new Icon(Icons.add),
       Colors.blue,
       4.0,
       "Button menu",
       yourFunction,
       "Click me",
       Colors.blue,
       Colors.white,
      )
```
The other one without text
```dart
  FabMiniMenuItem.noText(
        new Icon(Icons.add),
        Colors.blue,
        4.0,
        "Button menu",
        yourFunction,
      )
```

## Usage
### Create a list with your desired elements and customize each one
```dart
 var _fabMiniMenuItemList = [
   new FabMiniMenuItem.withText(
       new Icon(Icons.add),
       Colors.blue,
       4.0,
       "Button menu 1",
     yourFunction1,
       "Click me",
       Colors.blue,
       Colors.white,
      ),
    new FabMiniMenuItem.noText(
      new Icon(Icons.add),
      Colors.blue,
      4.0,
      "Button menu 2",
      yourFunction2,
    )
    ];
```


### Add the Dialer to your UI
```dart

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //The list of FabMiniMenuItems that we are going to use
    var _fabMiniMenuItemList = [
   new FabMiniMenuItem.withText(
       new Icon(Icons.add),
       Colors.blue,
       4.0,
       "Button menu",
     _incrementCounter,
       "Click me",
       Colors.blue,
       Colors.white,
      ),
    new FabMiniMenuItem.noText(
      new Icon(Icons.add),
      Colors.blue,
      4.0,
      "Button menu",
      _incrementCounter,
    )
    ];
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      //Using a Stack will assure that the Dialer will appear at the end of your layout
      body:  new Stack(
          children: <Widget>[
            new Center(
              child: new Column(
                children: <Widget>[
                  new Text('You have pushed the button this many times:'),
                  new Text('$_counter', style: Theme.of(context).textTheme.display1),
                ],
              ),
            ),
            new FabDialer(_fabMiniMenuItemList, Colors.blue, new Icon(Icons.add)),
          ],
        ),
    );
  }
}
```

