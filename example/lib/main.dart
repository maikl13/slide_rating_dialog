import 'package:flutter/material.dart';
import 'package:slide_rating_dialog/slide_rating_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide Rating Dialog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Slide Rating Dialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cont) =>
                        SlideRatingDialog(
                            onRatingChanged: (rating){
                              print(rating.toString());
                            },

                            buttonOnTap: (){
                              // Do your Business Logic here;
                              Navigator.pop(context);

                            },

                          buttonTitle: "Rate Us",
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 48.0,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(12.0)
                ),
                alignment: Alignment.center,
                child: const Text("Show Dialog",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
