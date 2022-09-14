import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.text,
    this.onTap,
    // this.isPressed = false,
  }) : super(key: key);
  final double deviceHeight;
  final double deviceWidth;
  final String text;
  final onTap;
  // final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: deviceHeight * 0.075,
        width: deviceWidth * 0.75,
        padding: EdgeInsets.all(deviceHeight * 0.01),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style:
              TextStyle(fontSize: 20, color: Theme.of(context).highlightColor),
        ),
      ),
    );
    // if (isPressed == true ) {
    //   return InkWell(
    //     onTap: null,
    //     child: Container(
    //       alignment: Alignment.center,
    //       height: deviceHeight * 0.075,
    //       width: deviceWidth * 0.75,
    //       padding: EdgeInsets.all(deviceHeight * 0.01),
    //       decoration: BoxDecoration(
    //         color: Colors.grey,
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       child: Text(
    //         text,
    //         style: TextStyle(
    //             fontSize: 20, color: Theme.of(context).highlightColor),
    //       ),
    //     ),
    //   );
    // } else {
    //   return InkWell(
    //     onTap: onTap,
    //     child: Container(
    //       alignment: Alignment.center,
    //       height: deviceHeight * 0.075,
    //       width: deviceWidth * 0.75,
    //       padding: EdgeInsets.all(deviceHeight * 0.01),
    //       decoration: BoxDecoration(
    //           color: Theme.of(context).primaryColor,
    //           borderRadius: BorderRadius.circular(10)),
    //       child: Text(
    //         text,
    //         style: TextStyle(
    //             fontSize: 20, color: Theme.of(context).highlightColor),
    //       ),
    //     ),
    //   );
    // }
  }
}
