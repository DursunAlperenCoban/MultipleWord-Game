import 'package:flutter/material.dart';
import 'package:word_game_multiple/wordhunt/pages/play.dart';

class HomePage extends StatefulWidget {
  HomePage({Key ?key}) : super(key: key);



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Pokemon name Catcher',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
            secondary: Colors.green),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',

      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
            onTap: () => {print(ModalRoute.of(context)?.settings.name),Navigator.pop(context), print(ModalRoute.of(context)?.settings.name),},
          ),
          title: Text('Pokemon name Catcher'),
        ),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text("Are you a boy or a girl?"),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(CircleBorder(),),
                    padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) =>
                    new PlayPage())),
                child: const Text('Catch em All'),
              )
            ],
          ),
        ),
      ),

    );
  }
}
