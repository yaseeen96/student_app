//pre-defined imports
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

//user-defined imports
import '../../utils/configurations.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = getDeviceWidth(context);
    final deviceHeight = getDeviceHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor,
      appBar: AppBar(
        toolbarHeight: deviceHeight * 0.10,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
        title: Text(
          "Welcome, Yaseen",
          style: TextStyle(
              color: Theme.of(context).highlightColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.all(deviceWidth * 0.05),
              iconSize: deviceHeight * 0.05,
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(deviceWidth * 0.03),
        constraints: BoxConstraints(maxHeight: deviceHeight * 0.22),
        decoration: BoxDecoration(border: Border.all()),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // picture
            Container(
              margin: EdgeInsets.only(right: deviceWidth * 0.05),
              width: deviceWidth * 0.38,
              height: deviceHeight * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/blockchain.png"),
                ),
              ),
            ),
            // second box
            Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Blockchain",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: deviceHeight * 0.015,
                ),
                Text(
                  'Start date: 04-09-22',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Text(
                  'Event: Online',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.035,
                ),
                Text(
                  "Duration: 3 Days",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            //third box
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_circle_right,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
