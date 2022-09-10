import 'package:student_app/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/configurations.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool _aboutEventExpanded = false;
  bool _eventTypeExpanded = false;
  bool _aboutResourceExpanded = false;
  bool _venueExpanded = false;
  bool _timingsExpanded = false;

  @override
  void initState() {
    // _customTileExpanded = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BlockChain Bootcamps",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        elevation: 0,
        leading: IconButton(
            color: Theme.of(context).primaryColor,
            iconSize: getDeviceWidth(context) * 0.07,
            onPressed: () => Navigator.pop(context, true),
            icon: Icon(Icons.arrow_back_rounded)),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(image: AssetImage('assets/images/blockchain.png')),
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "About Event",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _aboutEventExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed lectus vestibulum mattis ullamcorper velit sed ullamcorper. Suscipit adipiscing bibendum est ultricies integer quis auctor elit sed. Eget nunc lobortis mattis aliquam faucibus purus in. Eu turpis egestas pretium aenean pharetra magna ac placerat vestibulum. Elementum nisi quis eleifend quam adipiscing vitae proin sagittis. Amet mauris commodo quis imperdiet massa tincidunt nunc pulvinar. Malesuada fames ac turpis egestas. Massa tincidunt dui ut ornare lectus sit amet est. Cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla. Donec adipiscing tristique risus nec feugiat in fermentum posuere. Elit sed vulputate mi sit amet. Adipiscing at in tellus integer. Auctor eu augue ut lectus arcu bibendum at varius vel. Elementum pulvinar etiam non quam lacus. Malesuada bibendum arcu vitae elementum curabitur vitae nunc. Eget mauris pharetra et ultrices neque. Feugiat sed lectus vestibulum mattis. Velit laoreet id donec ultrices. In nulla posuere sollicitudin aliquam ultrices sagittis.",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _aboutEventExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "Type of event",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _eventTypeExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "The <eventTitle> event is <eventType>",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _eventTypeExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "About Resource Person",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _aboutResourceExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "Name: <resourcename>",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "<aboutResource>",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).canvasColor),
                      ),
                      Text(
                        "<social media link>",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).canvasColor),
                      ),
                    ],
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _aboutResourceExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "Venue",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _venueExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "The Event is to be held in <venue>",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _venueExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              backgroundColor: Theme.of(context).highlightColor,
              collapsedBackgroundColor: Theme.of(context).highlightColor,
              title: Text(
                "Scheduled Date",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).canvasColor,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _timingsExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
                size: getDeviceWidth(context) * 0.1,
              ),
              children: [
                ListTile(
                  title: Text(
                    "The Event is schedule to start on <startDate> and end on <endDate>",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _timingsExpanded = expanded);
              },
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            customButton(
                deviceHeight: getDeviceHeight(context),
                deviceWidth: getDeviceWidth(context) * 0.5,
                text: "Register Now")
          ],
        ),
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
  }
}
