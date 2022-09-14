import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:student_app/interfaces/event_image_interface.dart';

import 'package:student_app/models/event_image_model.dart';
import 'package:student_app/services/event_image_service.dart';

import 'package:student_app/utils/configurations.dart';

import '../../models/events_model.dart';

class EventPictures extends StatefulWidget {
  EventPictures({super.key, required this.eventId});

  final int eventId;
  @override
  State<EventPictures> createState() => _EventPicturesState();
}

class _EventPicturesState extends State<EventPictures> {
  late Future<List<EventsImageModel>> _data;

  final ImageList _eventImage = EventImageList();
  late List<EventsImageModel> imageList;

  @override
  void initState() {
    // TODO: implement initState

    _data = _eventImage.getEventsImage();
  }

  @override
  Widget build(BuildContext context) {
    // defining event images list

    late List<Widget> eventImages = [];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context, true),
        ),
        backgroundColor: Theme.of(context).highlightColor,
        title: Text(
          "Event Pictures",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: FutureBuilder<List<EventsImageModel>>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              imageList = snapshot.data!;
              print("Image List : ${imageList}");
              return GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: imageList
                    .map((e) => EventImageView(dataList: e))
                    .where((element) =>
                        element.dataList.event!.id == widget.eventId)
                    .toList(),
              );
            } else if (snapshot.data == null) {
              return Center(
                  child: Text(
                "No Data",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ));
            }
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }

          //   if (snapshot != null) {
          //     return GridView.count(
          //       crossAxisCount: 2,
          //       scrollDirection: Axis.vertical,
          //       children: imageList
          //           .map((e) => EventImageView(dataList: e))
          //           .where(
          //               (element) => element.dataList.event!.id == widget.eventId)
          //           .toList(),
          //     );
          //   } else if (snapshot.data == null) {
          //     return Center(
          //         child: Text(
          //       "No Data",
          //       style: TextStyle(color: Theme.of(context).primaryColor),
          //     ));
          //   } else
          //     return Center(
          //       child: CircularProgressIndicator(
          //         color: Theme.of(context).primaryColor,
          //       ),
          //     );
          // },
          ),
      backgroundColor: Theme.of(context).highlightColor,
    );
  }
}

class EventImageView extends StatelessWidget {
  const EventImageView({Key? key, required this.dataList}) : super(key: key);

  final EventsImageModel dataList;

  @override
  Widget build(BuildContext context) {
    return FullScreenWidget(
      backgroundColor: Theme.of(context).highlightColor,
      child: Center(
        child: Container(
          width: getDeviceWidth(context),
          height: getDeviceHeight(context) * 0.5,
          child: Image.network(
            width: 20,
            height: 10,
            "${dataList.eventImage}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
