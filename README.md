## Slide Rating Dialog

The Slide Rating Dialog Flutter package provides a beautiful and customizable widget for collecting rating about user experience. It offers a modern & Interactive design with smooth animations, making it perfect for collecting user feedbacks and rating in your app.

## Screenshots

<img src="https://i.postimg.cc/XNy3yG7F/s1.png" width="300" />
<img src="https://i.postimg.cc/hPWn8DfY/s2.png" width="300" />

[comment]: <> (<img src="https://i.postimg.cc/pXnSC8gQ/s3.png" width="300" />)
## Video

<img src="https://i.postimg.cc/qv33mkFk/sample-video-rating-dialog.gif" width="300" />


## Features
• Slide to rate: Users can easily slide their finger to select their desired rating.<br>
• Customizable design: You can customize the dialog's appearance, including colors, icons, and text.<br>
• Callback function: Receive and handle user ratings with a callback function.<br>
• Support for both iOS and Android platforms.<br>
• Highly responsive: Designed for smooth and intuitive user interactions.

## Installation
To use the Slide Rating Dialog package, follow these steps:

1. Add the package to your pubspec.yaml file:
```yaml
 dependencies:
   slide_rating_dialog: <latest version>
```

2. Run the following command to fetch the package:
```yaml
 flutter pub get
```
3. Import the package in your Dart code:
```yaml
import 'package:slide_rating_dialog/slide_rating_dialog.dart';
```

## Usage
To use the Slide Rating Dialog in your Flutter app, see example:

```dart
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
                          },
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
```

## Contributions and Support
We welcome your feedback and contributions to make Slide Rating Dialog even better. If you encounter any issues or have ideas for improvements, please open an issue on our GitHub repository. [Open Issue](https://github.com/Zee604/slide_rating_dialog.git).

## License
**This project is licensed under the [MIT License](https://opensource.org/license/mit/).**
