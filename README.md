
# Introduction

This is a Widget build for having an alternative to default menus

![alt text](https://github.com/Leondev7/flutter_fab_dialer/blob/master/src/demo.gif )

There are four types of fab menu items

With text and image associated
```dart
  FabMiniMenuItem.withTextWithImage(
          img,
          4.0,
          "Button menu",
          _logCounter,
          "Click me",
          Colors.blue,
          Colors.white,
          true
        ),
```
With only text associated
```dart
  FabMiniMenuItem.withText(
          new Icon(Icons.add),
          Colors.blue,
          4.0,
          "Button menu",
          _incrementCounter,
          "Click me",
          Colors.blue,
          Colors.white,
          true
        )
```

With no text and image associated
```dart
  FabMiniMenuItem.noTextWithImage(
          img,
          4.0,
          "Button menu",
          _incrementCounter,
          false
        )
```

With no text and no image associated
```dart
  FabMiniMenuItem.noText(
          new Icon(Icons.add),
          Colors.blue,
          4.0,
          "Button menu",
          _logCounter,
          false
        )
```

## Usage
### Create a list with your desired elements and customize each one
```dart
 var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withTextWithImage(
        img,
        4.0,
        "Button menu",
        _logCounter,
        "Click me",
        Colors.blue,
        Colors.white,
        true
      ),

      new FabMiniMenuItem.withText(
        new Icon(Icons.add),
        Colors.blue,
        4.0,
        "Button menu",
        _incrementCounter,
        "Click me",
        Colors.blue,
        Colors.white,
        true
      ),
      new FabMiniMenuItem.noText(
        new Icon(Icons.add),
        Colors.blue,
        4.0,
        "Button menu",
        _logCounter,
        false
      ),

      new FabMiniMenuItem.noTextWithImage(
        img,
        4.0,
        "Button menu",
        _incrementCounter,
        false
      )
    ];
```


### Add the Dialer to your UI
```dart

class _MyHomePageState extends State<MyHomePage> {

  //Provides an image of a cat
  static String getNewCatUrl() {
     return 'http://thecatapi.com/api/images/get?format=src&type=jpg&size=small'
         '#${new DateTime.now().millisecondsSinceEpoch}';
   }

   int _counter = 0;

  //Adds value to counter
   void _incrementCounter() {
     setState(() {
       _counter++;
     });
   }

   //Prints the value of the counter
   void _logCounter() {
     setState(() {
       print(_counter);
     });
   }

  @override
   Widget build(BuildContext context) {

     ImageProvider img = new NetworkImage(getNewCatUrl());

    //The list of FabMiniMenuItems that we are going to use
     var _fabMiniMenuItemList = [
       new FabMiniMenuItem.withTextWithImage(
         img,
         4.0,
         "Button menu",
         _logCounter,
         "Click me",
         Colors.blue,
         Colors.white,
         true
       ),

       new FabMiniMenuItem.withText(
         new Icon(Icons.add),
         Colors.blue,
         4.0,
         "Button menu",
         _incrementCounter,
         "Click me",
         Colors.blue,
         Colors.white,
         true
       ),
       new FabMiniMenuItem.noText(
         new Icon(Icons.add),
         Colors.blue,
         4.0,
         "Button menu",
         _logCounter,
         false
       ),

       new FabMiniMenuItem.noTextWithImage(
         img,
         4.0,
         "Button menu",
         _incrementCounter,
         false
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

