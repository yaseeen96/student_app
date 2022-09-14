import 'package:ftoast/ftoast.dart';
import 'package:student_app/interfaces/event_register_interface.dart';
import 'package:student_app/models/event_register_model.dart';
import 'package:student_app/services/event_register_service.dart';
import 'package:student_app/views/events/event_pictures.dart';
import 'package:student_app/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../interfaces/response_interface.dart';
import '../../models/events_model.dart';
import '../../models/response_model.dart';
import '../../models/student_profile_model.dart';
import '../../services/response_service.dart';
import '../../utils/configurations.dart';
import '../user/user_page.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key, required this.eventData, required this.user});

  final EventsModel? eventData;
  final StudentProfileModel? user;
  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool _aboutEventExpanded = false;
  bool _eventTypeExpanded = false;
  bool _aboutResourceExpanded = false;
  bool _venueExpanded = false;
  bool _timingsExpanded = false;

  final EventRegister _register = StudentEventRegister();
  EventRegisterModel? registerDetails;

  //flutter toast
  void alredyRegistered() => FToast.toast(
        context,
        msg: "Already registered",
      );
  void eventRegistered() => FToast.toast(
        context,
        msg: "Regitration Done!!!",
      );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool registered = false;
    String text = "Register now";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.eventData!.eventTitle}",
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
            onPressed: () {
              setState(() {
                registered = false;
                text = "Register now";
              });
              Navigator.pop(context, true);
            },
            icon: Icon(Icons.arrow_back_rounded)),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                  width: getDeviceWidth(context),
                  height: getDeviceHeight(context) * 0.25,
                  image: NetworkImage('${widget.eventData!.image}')),
            ),
            SizedBox(
              height: getDeviceHeight(context) * 0.02,
            ),
            ExpansionTile(
              initiallyExpanded: true,
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
                    "${widget.eventData!.aboutEvent}",
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
              initiallyExpanded: true,
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
                    "${widget.eventData!.eventType}",
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
              initiallyExpanded: true,
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
                    "${widget.eventData!.aboutResource}",
                    style: TextStyle(
                        fontSize: 14.sp, color: Theme.of(context).canvasColor),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.eventData!.aboutResource}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).canvasColor),
                      ),
                      Text(
                        "${widget.eventData!.social}",
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
              initiallyExpanded: true,
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
                    "${widget.eventData!.venue}",
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
              initiallyExpanded: true,
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
                    "The Event is schedule to start on ${widget.eventData!.startDate} and end on ${widget.eventData!.endDate}",
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

            // Register Button

            // if (pressed == false)

            //Proper Implemet of register.
            //Problem - We need 1 student ID to register for one event ID only once
            //Solution - Requirements 1. student ID & registartion details student ID
            //                        2. event ID & registartion details event ID
            //

            //Register
            InkWell(
              onTap: () async {
                registerDetails =
                    await _register.EventRegistration(widget.eventData!.id);

                registerDetails!.usn == null
                    ? alredyRegistered()
                    : eventRegistered();
              },
              child: Container(
                alignment: Alignment.center,
                height: getDeviceHeight(context) * 0.075,
                width: getDeviceWidth(context) * 0.75,
                padding: EdgeInsets.all(getDeviceHeight(context) * 0.01),
                decoration: BoxDecoration(
                  // color: Theme.of(context).primaryColor,

                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                //Dynamic text data added below
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).highlightColor),
                ),
              ),
            ),

            SizedBox(
              height: getDeviceHeight(context) * 0.03,
            ),

            //Add Pictures
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EventPictures(eventId: widget.eventData!.id!)));
              },
              child: Container(
                alignment: Alignment.center,
                height: getDeviceHeight(context) * 0.075,
                width: getDeviceWidth(context) * 0.75,
                padding: EdgeInsets.all(getDeviceHeight(context) * 0.01),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "View Pictures",
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).highlightColor),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
  }
}
