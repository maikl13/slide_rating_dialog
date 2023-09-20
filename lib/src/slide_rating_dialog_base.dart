import 'package:flutter/material.dart';
import 'package:slide_rating_dialog/src/utils.dart';

typedef OnChangeCallback = void Function(int index);

class SlideRatingDialog extends StatefulWidget {

  /// Callback When rating changes.
  final Function(int value)? onRatingChanged;

  /// Submit button pressed.
  final Function()? buttonOnTap;

  /// Dialog Title
  final String title;

  /// Dialog Sub Title
  final String subTitle;

  /// Color for submit Button
  final Color buttonColor;

  /// Dialog Cancel button
  final bool cancelButton;





  const SlideRatingDialog({Key? key,
    required this.onRatingChanged,
    this.title = "Rating",
    this.subTitle = "How was your experience with us?",
    this.buttonColor = Colors.deepPurpleAccent,
    this.cancelButton = true,
    required this.buttonOnTap,
  }) : super(key: key);

  @override
  State<SlideRatingDialog> createState() => _SlideRatingDialogState();
}

class _SlideRatingDialogState extends State<SlideRatingDialog> {
  int starCount = 4;
  double dxSet = 181.2;
  double left = 0.0;
  double right = 0.0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var size  = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: SizedBox(
        height: widget.cancelButton ? size.height * 0.6 : size.height * 0.57,
        width: size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              widget.cancelButton ? Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close,
                  color: Colors.black,
                  size: 24.0,),
                ),
              ) : SizedBox(),
              Text(widget.title,
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),),
              const SizedBox(height: 12.0, width: 0.0,),
              Text(widget.subTitle,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                ),),
              const SizedBox(height: 20.0, width: 0.0,),
              Image.asset("assets/images/i$starCount.png",
                package: 'slide_rating_dialog',
              height: 110.0,),
              const SizedBox(height: 12.0, width: 0.0,),
              Text(getMessage(starCount),
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                ),),
              const SizedBox(height: 30.0, width: 0.0,),
              Stack(
                children: [
                  Container(
                    width:  size.width * 0.8,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0xFFF1F5F8)
                    ),
                  ),
                  AnimatedContainer(
                    width: getWidth(context, starCount),
                    height: 60.0,
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0xFFFFFFFF).withOpacity(0.7)
                    ),
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.transparent
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Image.asset(
                          "assets/images/star_selected.png",
                        package: 'slide_rating_dialog',
                        height: 38.0,
                        width: 38.0,),

                        Image.asset(
                          starCount < 2 ? "assets/images/star_unselected.png" :"assets/images/star_selected.png",
                          package: 'slide_rating_dialog',
                          height: 38.0,
                          width: 38.0,),

                          Image.asset(
                            starCount < 3 ? "assets/images/star_unselected.png" :"assets/images/star_selected.png",
                            package: 'slide_rating_dialog',
                            height: 38.0,
                            width: 38.0,),

                          Image.asset(
                            starCount < 4 ? "assets/images/star_unselected.png" :"assets/images/star_selected.png",
                            package: 'slide_rating_dialog',
                            height: 38.0,
                            width: 38.0,),

                          Image.asset(
                            starCount < 5 ? "assets/images/star_unselected.png" :"assets/images/star_selected.png",
                            package: 'slide_rating_dialog',
                            height: 38.0,
                            width: 38.0,),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(dxSet, -5),
                    child: Draggable(
                      axis: Axis.horizontal,
                      affinity: Axis.horizontal,
                      maxSimultaneousDrags: 1,
                      onDragUpdate: (valo) {
                        print("Local ====>>>"+valo.localPosition.toString());
                        print("Global ====>>>"+valo.globalPosition.toString());

                        if(valo.globalPosition.dx <= 101.0){
                          setState(() {
                            starCount = 1;
                          });
                        }else if(valo.globalPosition.dx >= 120.0 && valo.globalPosition.dx <= 143.4){
                          setState(() {
                            starCount = 2;
                          });
                        }else if(valo.globalPosition.dx > 166.0 && valo.globalPosition.dx <= 194.6){
                          setState(() {
                            starCount = 3;
                          });
                        }else if(valo.globalPosition.dx > 228.0 && valo.globalPosition.dx <= 257.1){
                          setState(() {
                            starCount = 4;
                          });
                        }else if(valo.globalPosition.dx > 299.0 ){
                          setState(() {
                            starCount = 5;
                          });
                        }

                      },
                      onDragEnd: (val){
                        print("End ====>>>"+val.offset.toString());
                        if(val.offset.dx <= 40.0){
                          setState(() {
                            dxSet = 0.0;
                            starCount = 1;
                          });
                          widget.onRatingChanged!(1);
                        }else if(val.offset.dx >= 281.1){
                          setState(() {
                            dxSet = 242.0;
                            starCount = 5;
                          });
                          widget.onRatingChanged!(5);
                        }else if(val.offset.dx >= 50 && val.offset.dx <= 102.0){
                          setState(() {
                            dxSet = 103.0 - 39.0;
                            starCount = 2;
                          });
                          widget.onRatingChanged!(2);
                        }else if(val.offset.dx >= 110.0 && val.offset.dx <= 161.0){
                          setState(() {
                            dxSet = 160.0 - 39.0;
                            starCount = 3;
                          });
                          widget.onRatingChanged!(3);
                        } else if(val.offset.dx >= 170.0 && val.offset.dx <= 220.0){
                          setState(() {
                            dxSet = 220.0 - 39.0;
                            starCount = 4;
                          });
                          widget.onRatingChanged!(4);
                        } else if(val.offset.dx >= 225.0 && val.offset.dx <= 282.0){
                          setState(() {
                            dxSet = 282.0 - 39.0;
                            starCount = 5;
                          });
                          widget.onRatingChanged!(5);
                        }else{
                          setState(() {
                            dxSet = val.offset.dx - 39.0;
                          });
                        }
                      },
                      feedback: Container(
                        width:  70,
                        height: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            color: Colors.white,
                            border: Border.all(
                                color: Color(0xFFFCBE29)
                            )
                        ),
                        alignment: Alignment.center,
                        child:  Image.asset("assets/images/star_selected.png",
                          package: 'slide_rating_dialog',
                          height: 38.0,
                          width: 38.0,),
                      ),
                      childWhenDragging: SizedBox(
                        width:  70,
                        height: 70.0,
                      ),
                      child: Container(
                        width:  70,
                        height: 70.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            color: Colors.white,
                            border: Border.all(
                                color: Color(0xFFFCBE29)
                            )
                        ),
                        alignment: Alignment.center,
                        child:  Image.asset("assets/images/star_selected.png",
                          package: 'slide_rating_dialog',
                          height: 38.0,
                          width: 38.0,),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0, width: 0.0,),
              GestureDetector(
                onTap: widget.buttonOnTap,
                child: Container(
                  width: size.width * 0.8,
                  height: 48.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: widget.buttonColor,
                  ),
                  alignment: Alignment.center,
                  child: Text("Submit",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }



  



}
